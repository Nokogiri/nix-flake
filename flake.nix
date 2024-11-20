{
  description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";
    stable.url = "github:nixos/nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.91.1-1.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hardware = {
      url = "github:nixos/nixos-hardware";
    };
    sops-nix = {
      url = "github:mic92/sops-nix";
    };
    nur = {
      url = "github:nix-community/NUR";
    };
    nix-index-database = {
      url = "github:Mic92/nix-index-database";
    };
    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1&ref=refs/tags/v0.45.2";
    };
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
    };
    iio-hyprland = {
      url = "github:JeanSchoeller/iio-hyprland";
    };
    #wezterm = {
    #  url = "git+https://github.com/wez/wezterm?dir=nix&submodules=1";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      forAllSystems = nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "x86_64-darwin"
      ];
    in
    rec {
      packages = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        import ./pkgs { inherit pkgs; }
      );

      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        import ./shell.nix { inherit pkgs; }
      );
      overlays = import ./overlays { inherit inputs; };

      nixosModules = import ./modules/nixos;

      homeManagerModules = import ./modules/home-manager;

      nixosConfigurations = {
        mowteng = nixpkgs.lib.nixosSystem {
          modules = [
            ./nixos/mowteng/configuration.nix
          ] ++ (builtins.attrValues nixosModules);
          specialArgs = {
            inherit inputs outputs;
          };
        };
      };

      nixosConfigurations = {
        homeassistant = nixpkgs.lib.nixosSystem {
          modules = [
            ./nixos/homeassistant/configuration.nix
          ] ++ (builtins.attrValues nixosModules);
          specialArgs = {
            inherit inputs outputs;
          };
        };
      };

      homeConfigurations = {
        "nokogiri@mowteng" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = {
            inherit inputs outputs;
          };
          modules = [ ./home-manager/mowteng ];
        };
      };

      homeConfigurations = {
        "nokogiri@homeassistant" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = {
            inherit inputs outputs;
          };
          modules = [ ./home-manager/homeassistant ];
        };
      };
    };
}

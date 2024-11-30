{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ../global
    ../features/cli/nix-stuff.nix
    ../features/desktop
    ../features/games
    ../features/media
    ../features/nvim
    #../features/sway
    ../features/hyprland
    inputs.nur.nixosModules.nur
  ];
  #nixpkgs.config.permittedInsecurePackages = [
  #             "dotnet-runtime-wrapped-7.0.20"
  #           ];
  home.packages = with pkgs; [
    handlr-regex
    gimp
    krita
    mullvad-vpn
    nextcloud-client
  ];
}

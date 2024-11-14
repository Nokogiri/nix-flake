{ pkgs, ... }:
{
  xdg.configFile."fish/themes/Dracula Official.theme".source = (
    pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/dracula/fish/refs/heads/master/themes/Dracula%20Official.theme";
      hash = "sha256-nq/+FmOpioQcspqhxdBs8jCjXLgOG1hfxcZaJsRXFxU=";
    }
  );
  programs.atuin.enableFishIntegration = true;
  programs.zoxide.enableFishIntegration = false;
  home.packages = [ pkgs.any-nix-shell ];
  programs.fish = {
    enable = true;
    functions = {
      fish_greeting = "";
    };
    plugins = [
      {
        name = "fzf";
        src = pkgs.fetchFromGitHub {
          owner = "PatrickF1";
          repo = "fzf.fish";
          rev = "8d99f0caa30a626369541f80848ffdbf28e96acc";
          sha256 = "nTiFD8vWjafYE4HNemyoUr+4SgsqN3lIJlNX6IGk+aQ=";
        };
      }
    ];
    shellAbbrs = {
      ipa = "ip -color -brief a";
      ls = "eza";
      n = "nix";
      nd = "nix develop -c $SHELL";
      ns = "nix shell";
      nsn = "nix shell nixpkgs#";
      nb = "nix build";
      nbn = "nix build nixpkgs#";
      nf = "nix flake";

      nr = "nixos-rebuild --flake .";
      nrs = "nixos-rebuild --flake . switch";
      snr = "doas nixos-rebuild --flake .";
      snrs = "doas nixos-rebuild --flake . switch";
      hm = "home-manager --flake .";
      hms = "home-manager --flake . switch";
    };
    shellAliases = {
      cat = "bat --paging=never --decorations=never";
      # Get ip
      rm = "${pkgs.trash-cli}/bin/trash-put -f";
      getip = "curl ifconfig.me";
      # SSH with kitty terminfo
      #kssh = "kitty +kitten ssh";
      # Clear screen and scrollback
      clear = "printf '\\033[2J\\033[3J\\033[1;1H'";
    };
    interactiveShellInit = ''
      fish_config theme choose Dracula\ Official
      any-nix-shell fish --info-right | source
      fzf_configure_bindings --history=\cr
    '';
  };
}

{ config, pkgs, ... }:
{
  home.packages = [
    pkgs.zsh-fzf-tab
    pkgs.nix-zsh-completions
    pkgs.any-nix-shell
  ];
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableVteIntegration = true;
    autocd = true;
    autosuggestion.enable = true;
    plugins = [
      {
        name = "fzf-tab";
        file = "share/fzf-tab/fzf-tab.zsh";
        src = pkgs.zsh-fzf-tab;
      }
      {
        # will source zsh-autosuggestions.plugin.zsh
        name = "zsh-autosuggestions";
        file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
        src = pkgs.zsh-autosuggestions;
      }
      {
        name = "zsh-syntax-highlighting";
        file = "share/zsh/site-functions/fast-syntax-highlighting.plugin.zsh";
        src = pkgs.zsh-fast-syntax-highlighting;
      }
      {
        name = "forgit";
        file = "/share/zsh/zsh-forgit/forgit.plugin.zsh";
        src = pkgs.zsh-forgit;
      }
      {
        name = "zsh-tab-title";
        src = pkgs.fetchFromGitHub {
          owner = "trystan2k";
          repo = "zsh-tab-title";
          rev = "v3.1.0";
          hash = "sha256-YvAN8c2++WRJYGblstZKWCWrCl0byXQqFryTA35/Ao0=";
        };
      }
    ];
    dotDir = ".config/zsh";
    history = {
      ignoreAllDups = true;
      ignoreSpace = true;
      path = "${config.xdg.dataHome}/zsh/zsh_history";
    };
    initExtra = ''
      ${pkgs.any-nix-shell}/bin/any-nix-shell zsh --info-right | source /dev/stdin
      bindkey -e

      bindkey "^[[3~" delete-char                     # Key Del
      bindkey "^[[5~" beginning-of-buffer-or-history  # Key Page Up
      bindkey "^[[6~" end-of-buffer-or-history        # Key Page Down
      bindkey "^[OH" beginning-of-line                # Key Home
      bindkey "^[OF" end-of-line                      # Key End
      bindkey "^[[1;3C" forward-word                  # Key Alt + Right
      bindkey "^[[1;3D" backward-word                 # Key Alt + Left

    '';
    localVariables = {
      WORDCHARS = "";
      ZSH_TAB_TITLE_ADDITIONAL_TERMS = "alacritty|kitty|foot";
    };
    zsh-abbr = {
      enable = true;
      abbreviations = {
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
    };
  };

  programs.fzf.enableZshIntegration = true;
  programs.atuin.enableZshIntegration = true;
  programs.starship.enableZshIntegration = true;
  programs.eza.enableZshIntegration = true;
  programs.zoxide.enableZshIntegration = true;
}

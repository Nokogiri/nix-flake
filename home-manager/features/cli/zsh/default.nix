{ config, pkgs, ... }:
{
  home.packages = [ pkgs.zsh-fzf-tab ];
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
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.7.0";
          sha256 = "sha256-KLUYpUu4DHRumQZ3w59m9aTW6TBKMCXl2UcKi4uMd7w=";
        };
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.8.0";
          sha256 = "sha256-iJdWopZwHpSyYl5/FQXEW7gl/SrKaYDEtTH9cGP7iPo=";
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
    };
  };

  programs.fzf.enableZshIntegration = true;
  programs.atuin.enableZshIntegration = true;
  programs.starship.enableZshIntegration = true;
  programs.eza.enableZshIntegration = true;
  programs.zoxide.enableZshIntegration = true;
}

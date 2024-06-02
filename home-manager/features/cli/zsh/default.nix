{ config, ... }:{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableVteIntegration = true;
    autocd = true;
    autosuggestion.enable = true;
    antidote = {
      enable = true;
      plugins = [
        "Aloxaf/fzf-tab"
        "hlissner/zsh-autopair"
        #"marlonrichert/zsh-autocomplete"
        #"wfxr/forgit"
        "zsh-users/zsh-autosuggestions"
        "zsh-users/zsh-syntax-highlighting"
        #"zsh-users/zsh-history-substring-search"
      ];
    };
    dotDir = ".config/zsh";
    history = {
      ignoreAllDups = true;
      ignoreSpace = true;
      path = "${config.xdg.dataHome}/zsh/zsh_history";
    };
  };

  programs.fzf.enableZshIntegration = true;
  programs.atuin.enableZshIntegration = true;
  programs.carapace.enableZshIntegration = true;
  programs.starship.enableZshIntegration = true;
  programs.eza.enableZshIntegration = true;
  programs.zoxide.enableZshIntegration = true;
}

{
  pkgs,
  inputs,
  ...
}: {
  home.packages = [
    inputs.alejandra.defaultPackage.x86_64-linux
  ];
  programs.vscode = {
    enable = true;
    extensions = with pkgs;
    with vscode-extensions; [
      vscode-taskexplorer
      jnoortheen.nix-ide
      ms-vscode.cmake-tools
      ms-vscode.cpptools
      bodil.file-browser
      catppuccin.catppuccin-vsc
      #asvetliakov.vscode-neovim
      shd101wyy.markdown-preview-enhanced
      kamadorueda.alejandra
    ];
    userSettings = {
      "cmake.showOptionsMovedNotification" = false;
      "editor.bracketPairColorization.enabled" = false;
      "editor.fontFamily" = "'JetBrains Mono'";
      "editor.lineHeight" = 1.5;
      "editor.smoothScrolling" = true;
      "editor.wordWrap" = "on";
      "files.autoSave" = "afterDelay";
      "files.trimTrailingWhitespace" = true;
      "markdown-preview-enhanced.previewTheme" = "github-dark.css";
      #"material-icon-theme.folders.color" = colors.accent;
      "material-icon-theme.folders.theme" = "classic";
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "${pkgs.nixd}/bin/nixd";
      "nix.serverSettings".nixd.options = {
        home.expr = "(builtins.getFlake \"/nix/config\").homeConfigurations.nixd.options";
        nixos.expr = "(builtins.getFlake \"/nix/config\").nixosConfigurations.mowteng.options";
      };
      "terminal.integrated.cursorBlinking" = true;
      "terminal.integrated.cursorStyle" = "line";
      "terminal.integrated.cursorStyleInactive" = "none";
      "terminal.integrated.fontFamily" = "'MesloLGS NF'";
      "terminal.integrated.fontSize" = 13;
      "terminal.integrated.lineHeight" = 1;
      "terminal.integrated.smoothScrolling" = true;
      "workbench.iconTheme" = "material-icon-theme";
      "workbench.list.smoothScrolling" = true;
      "workbench.colorTheme" = "Catppuccin Frappé";
    };
    package = pkgs.vscodium;
  };
}

{
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    installBatSyntax = true;
    settings = {
      background-opacity = 0.8;
      font-family = "JetBrainsMono Nerd Font Mono";
      adw-toolbar-style = "raised";

      keybind = [
        "ctrl+alt+m=toggle_tab_overview"
      ];
    };
  };
}

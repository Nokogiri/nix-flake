{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    settings = {
      format = "$all";
      add_newline = false;
      character = {
        success_symbol = "[[󰄴](green) ❯](maroon)";
        error_symbol = "[❯](red)";
        vicmd_symbol = "[❮](green)";
      };
      battery = {
        disabled = true;
      };
    };
  };
}

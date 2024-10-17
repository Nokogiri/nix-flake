{
  services.fnott = {
    enable = true;
    settings = {
      main = {
        notification-margin = 5;
        border-radius = 6;
        background = "282a36aa";
        #border-color = "282a36aa";
        border-size = "2";
        max-width = "460";
        icon-theme = "Dracula";
        selection-helper = "fuzzel -d";
        stacking-order = "top-down";
        title-font = "JetBrainsMono Nerd Font:size=14";
        body-font = "JetBrainsMono Nerd Font:size=11";
        summary-font = "JetBrainsMono Nerd Font:size=10";
      };
      normal = {
        border-color = "282a36aa";
      };
      critical = {
        border-color = "ff5555aa";
      };
      low = {
        border-color = "282a36aa";
      };
    };
  };
}

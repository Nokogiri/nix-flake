{
  programs.hyprlock = {
    enable = true;
    settings = {
      authentication = {
        fingerprint = {
          enabled = true;
        };
      };
      background = [
        {
          path = "screenshot";
          blur_passes = 3;
          blur_size = 8;
        }
      ];
      general = {
        disable_loading_bar = false;
        grace = 30;
        hide_cursor = true;
        no_fade_in = false;
      };
      input-field = [
        {
          size = "200, 50";
          position = "0, -80";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          font_color = "rgb(202, 211, 245)";
          inner_color = "rgb(91, 96, 120)";
          outer_color = "rgb(24, 25, 38)";
          outline_thickness = 5;
          placeholder_text = "'\'<span foreground=\"##cad3f5\">Password...</span>'\'";
          shadow_passes = 2;
        }
      ];
    };
  };
}

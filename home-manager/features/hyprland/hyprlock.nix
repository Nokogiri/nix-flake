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
          blur_passes = 1;
          blur_size = 3;
        }
      ];
      general = {
        disable_loading_bar = false;
        grace = 30;
        hide_cursor = true;
        no_fade_in = false;
      };
    };
  };
}

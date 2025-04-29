{
  pkgs,
  lib,
  ...
}: {
  services.dunst = {
    enable = true;
    settings = {
      global = {
        browser = "${lib.getExe pkgs.floorp}";
        corner_radius = 10;
        corners = "all";
        origin = "top-center";

        #width = "(120, 480)";
        width = 400;
        height = "(80, 320)";
        icon_corner_radius = 6;
        icon_corners = "all";
        alignment = "center";
        frame_width = 2;
        frame_color = "#89b4faCC";
        separator_color = "frame";
        highlight = "#89b4fa";
        font = "JetBrainsMono Nerd Font 11";
      };
      urgency_low = {
        background = "#1e1e2eCC";
        foreground = "#cdd6f4";
      };
      urgency_normal = {
        background = "#1e1e2eCC";
        foreground = "#cdd6f4";
      };
      urgency_critical = {
        background = "#1e1e2eCC";
        foreground = "#cdd6f4";
        frame_color = "#fab387CC";
      };
    };
  };
}

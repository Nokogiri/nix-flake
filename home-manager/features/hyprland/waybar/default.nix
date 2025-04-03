{pkgs, ...}: {
  home.packages = [pkgs.wttrbar];
  programs.waybar = {
    enable = true;
    style = ./style.css;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 42;

        modules-left = [
          "hyprland/workspaces"
        ];
        modules-center = ["hyprland/window"];
        modules-right = [
          "tray"
          "battery"
          "network"
          "pulseaudio"
          "clock"
        ];
        "group/misc" = {
          orientation = "inherit";
          drawer = {
            transition-duration = 500;
            children-class = "not-power";
            transition-left-to-right = false;
          };
          modules = [
            "network"
            "tray"
          ];
        };
        "hyprland/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            "6" = "";
            focused = "";
            default = "";
            persistant = "◌";
            empty = "◌";
          };
        };
        "hyprland/window" = {
          format = "👉 {}";
          rewrite = ''
            "(.*) — Ablaze Floorp": "🌎 $1"
            "(.*) - fish": "> [$1]"
          '';
        };
        "clock" = {
          format = "{:%H:%M}";
          format-alt = "{:%d.%m.%Y %H:%M}";
          tooltip-format = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
          min-length = 5;
        };
        "battery" = {
          bat = "BAT0";
          states = {
            good = 81;
            warning = 35;
            critical = 20;
          };
          format-charging = "{capacity}% {icon} 󱐌";
          format-full = "{capacity}% {icon}";
          format-discharging = "{capacity}% {icon}";
          format-icons = [
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
          tooltip = true;
        };
        "network" = {
          format-wifi = "󰤨 ";
          format-ethernet = "";
          format-linked = "(No IP) ";
          format-disconnected = "";
          interval = 60;
          on-click = "${pkgs.networkmanagerapplet}/bin/nm-connection-editor";
        };
        "pulseaudio" = {
          scroll-step = 2.5;
          tooltip-format = "{icon} {desc} {volume}%";
          format = " {icon} ";
          format-bluetooth = " {icon} ";
          format-bluetooth-muted = " 󰟎 ";
          format-muted = "  ";
          format-source = "{volume}%  ";
          format-source-muted = " ";
          format-icons = {
            headphone = "󰋋";
            hands-free = "";
            headset = "󰋋";
            phone = "";
            portable = "";
            car = "";
            default = "󰕾";
          };
          on-click = "${pkgs.lxqt.pavucontrol-qt}/bin/pavucontrol-qt";
          tooltip = true;
        };
        "tray" = {
          show-passive-items = true;
          spacing = 10;
        };
        "custom/weather" = {
          format = "{}°C";
          tooltip = true;
          interval = 60;
          exec = "${pkgs.wttrbar}/bin/wttrbar --date-format \"%m/%d\" --location Erfurt --hide-conditions --lang de";
          return-type = "json";
        };
      };
    };
  };
}

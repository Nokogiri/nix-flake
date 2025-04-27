{
  pkgs,
  inputs,
  lib,
  ...
}: {
  wayland.windowManager.hyprland = {
    settings = {
      animations = {
        enabled = true;
        bezier = [
          "easein,0.11, 0, 0.5, 0"
          "easeout,0.5, 1, 0.89, 1"
          "easeinout,0.45, 0, 0.55, 1"
          "myBezier, 0.05, 0.9, 0.1, 1.05"
        ];
        animation = [
          "windows, 1, 3, myBezier"
          "windowsOut, 1, 3, default, popin 10%"
          "border, 1, 5, default"
          "borderangle, 1, 4, default"
          "fade, 1, 3, default"
          "workspaces, 1, 2, default"
        ];
      };
      binds = {
        workspace_back_and_forth = true;
        movefocus_cycles_fullscreen = false;
      };
      bindm = [
        "SUPER,mouse:272,movewindow"
        "SUPER,mouse:273,resizewindow"
      ];
      bind = [
        "SUPER,Return,exec,kitty"
        "SUPER,w,exec,${lib.getBin pkgs.swaynotificationcenter}/bin/swaync-client -t"
        "SUPER,p,exec,pkill -9 rofi > /dev/null 2>&1 || ${lib.getBin pkgs.rofi-wayland}/bin/rofi -show drun -modes drun,filebrowser,keys,window"
        "SUPER,i,exec,cliphist list | ${lib.getBin pkgs.rofi-wayland}/bin/rofi -dmenu | cliphist decode | wl-copy"
        ",XF86Tools,exec,pkill -USR1 waybar # profile button"
        ",Print,exec,grimblast --notify copy output"
        "SHIFT,Print,exec,grimblast --notify copy active"
        "CONTROL,Print,exec,grimblast --notify copy screen"
        "SUPER,Print,exec,grimblast --notify copy window"
        "ALT,Print,exec,grimblast --notify copy area"
        ",XF86MonBrightnessUp,exec,${lib.getBin pkgs.swayosd}/bin/swayosd-client --brightness raise"
        ",XF86MonBrightnessDown,exec,${lib.getBin pkgs.swayosd}/bin/swayosd-client --brightness lower"
        "ALT,XF86AudioRaiseVolume,exec,${lib.getBin pkgs.swayosd}/bin/swayosd-client --playerctl=next"
        "ALT,XF86AudioLowerVolume,exec,${lib.getBin pkgs.swayosd}/bin/swayosd-client --playerctl=previous"
        ",XF86AudioNext,exec,${lib.getBin pkgs.swayosd}/bin/swayosd-client --playerctl=next"
        ",XF86AudioPrev,exec,${lib.getBin pkgs.swayosd}/bin/swayosd-client --playerctl=previous"
        ",XF86AudioPlay,exec,${lib.getBin pkgs.swayosd}/bin/swayosd-client --playerctl=play-pause"
        ",XF86AudioPause,exec,${lib.getBin pkgs.swayosd}/bin/swayosd-client --playerctl=play-pause"
        ",XF86AudioStop,exec,${lib.getBin pkgs.swayosd}/bin/swayosd-client --playerctl=stop"
        "ALT,XF86AudioNext,exec,${lib.getBin pkgs.swayosd}/bin/swayosd-client --playerctl=d shift"
        "ALT,XF86AudioPrev,exec,${lib.getBin pkgs.swayosd}/bin/swayosd-client --playerctl=d unshift"
        "ALT,XF86AudioPlay,exec,systemctl --user restart playerctld"
        ",XF86AudioRaiseVolume,exec,${lib.getBin pkgs.swayosd}/bin/swayosd-client --output-volume raise"
        ",XF86AudioLowerVolume,exec,${lib.getBin pkgs.swayosd}/bin/swayosd-client --output-volume lower"
        ",XF86AudioMute,exec,${lib.getBin pkgs.swayosd}/bin/swayosd-client --output-volume mute-toggle"
        "SHIFT,XF86AudioMute,exec,pactl set-source-mute @DEFAULT_SOURCE@ toggle"
        ",XF86AudioMicMute,exec,pactl set-source-mute @DEFAULT_SOURCE@ toggle"
        "SUPERSHIFT,q,killactive"
        #"SUPERSHIFT,e,exec,uwsm stop"
        ",XF86PowerOff,exec,${(pkgs.writeShellScriptBin "power-menu" ''          ${pkgs.rofi-wayland}/bin/rofi \
                  -modi p:${pkgs.rofi-power-menu}/bin/rofi-power-menu \
                  -show p \
                  -theme-str 'window {width: 10em;} listview {lines: 6;}' \
                  -font "JetBrainsMono Nerd Font 20" \
                  -display-p PowerMenu
        '')}/bin/power-menu"
        "SUPER,s,togglesplit"
        "SUPER,f,fullscreen,1"
        "SUPERSHIFT,f,fullscreen,0"
        "SUPERSHIFT,space,togglefloating"
        "SUPER,minus,splitratio,-0.25"
        "SUPERSHIFT,minus,splitratio,-0.3333333"
        "SUPER,equal,splitratio,0.25"
        "SUPERSHIFT,equal,splitratio,0.3333333"
        "SUPER,g,togglegroup"
        "SUPER,apostrophe,changegroupactive,f"
        "SUPERSHIFT,apostrophe,changegroupactive,b"
        "SUPER,left,movefocus,l"
        "SUPER,right,movefocus,r"
        "SUPER,up,movefocus,u"
        "SUPER,down,movefocus,d"
        "SUPERSHIFT,left,movewindow,l"
        "SUPERSHIFT,right,movewindow,r"
        "SUPERSHIFT,up,movewindow,u"
        "SUPERSHIFT,down,movewindow,d"
        "SUPERCONTROL,left,focusmonitor,l"
        "SUPERCONTROL,right,focusmonitor,r"
        "SUPERCONTROL,up,focusmonitor,u"
        "SUPERCONTROL,down,focusmonitor,d"
        "SUPERCONTROL,1,focusmonitor,eDP-1"
        "SUPERCONTROL,2,focusmonitor,DP-1"
        "SUPERCONTROLSHIFT,left,movewindow,mon:l"
        "SUPERCONTROLSHIFT,right,movewindow,mon:r"
        "SUPERCONTROLSHIFT,up,movewindow,mon:u"
        "SUPERCONTROLSHIFT,down,movewindow,mon:d"
        "SUPERCONTROLSHIFT,1,movewindow,mon:eDP-1"
        "SUPERCONTROLSHIFT,2,movewindow,mon:DP-2"
        "SUPERCONTROLSHIFT,3,movewindow,mon:DP-3"
        "SUPERALT,left,movecurrentworkspacetomonitor,l"
        "SUPERALT,right,movecurrentworkspacetomonitor,r"
        "SUPERALT,up,movecurrentworkspacetomonitor,u"
        "SUPERALT,down,movecurrentworkspacetomonitor,d"
        "SUPER,u,togglespecialworkspace"
        "SUPERSHIFT,u,movetoworkspace,special"
        "SUPER,1,workspace,01"
        "SUPER,2,workspace,02"
        "SUPER,3,workspace,03"
        "SUPER,4,workspace,04"
        "SUPER,5,workspace,05"
        "SUPER,6,workspace,06"
        "SUPER,7,workspace,07"
        "SUPER,8,workspace,08"
        "SUPER,9,workspace,09"
        "SUPERSHIFT,1,movetoworkspacesilent,01"
        "SUPERSHIFT,2,movetoworkspacesilent,02"
        "SUPERSHIFT,3,movetoworkspacesilent,03"
        "SUPERSHIFT,4,movetoworkspacesilent,04"
        "SUPERSHIFT,5,movetoworkspacesilent,05"
        "SUPERSHIFT,6,movetoworkspacesilent,06"
        "SUPERSHIFT,7,movetoworkspacesilent,07"
        "SUPERSHIFT,8,movetoworkspacesilent,08"
        "SUPERSHIFT,9,movetoworkspacesilent,09"
      ];
      cursor = {
        sync_gsettings_theme = true;
        hide_on_key_press = true;
        hide_on_touch = true;
        inactive_timeout = "0";
        warp_back_after_non_mouse_input = true;
      };
      decoration = {
        active_opacity = "1.0";
        inactive_opacity = "0.8";
        fullscreen_opacity = "1.0";
        rounding = "10";
        rounding_power = "4.0";
        shadow = {
          color = "rgba(0C0E13A6)";
          enabled = true;
          range = "16";
          offset = "2 2";
          render_power = "2";
          scale = "0.97";
        };
        dim_around = "0.8";
        blur = {
          enabled = true;
          size = "4";
          passes = "3";
          ignore_opacity = true;
          new_optimizations = true;
        };
      };
      device = [
        {
          name = "wacom-hid-49c8-finger";
          output = "eDP-1";
          enabled = true;
        }
        {
          name = "wacom-hid-49c8-pen";
          output = "eDP-1";
          enabled = true;
        }
      ];
      ecosystem = {
        no_update_news = true;
        no_donation_nag = true;
      };
      env = [
        "NIXOS_OZONE_WL,1"
        "XCURSOR_SIZE,24"
        "XCURSOR_THEME,breeze_cursors"
        "GTK_THEME,catppuccin-mocha-mauve-standard"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "MOZ_DISABLE_RDD_SANDBOX,1"
        "MOZ_ENABLE_WAYLAND,1"
        "OZONE_PLATFORM,wayland"
        "QT_QPA_PLATFORM,wayland"
        "QT_QPA_PLATFORMTHEME,qt5ct" #env = QT_STYLE_OVERRIDE,kvantum
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "_JAVA_AWT_WM_NONREPARENTING,1"
      ];
      general = {
        gaps_in = "10";
        gaps_out = "12";
        border_size = "0";
        #"col.active_border" = "rgb(44475a) rgb(bd93f9) 90deg";
        #"col.inactive_border" = "rgba(44475aaa)";
        #"col.nogroup_border" = "rgba(282a36dd)";
        #"col.nogroup_border_active" = "rgb(bd93f9) rgb(44475a) 90deg";
        no_border_on_floating = true;

        # non-gradient alternative
        "col.active_border" = "rgba(bd93f966)";
        "col.inactive_border" = "rgba(44475a66)";
        "col.nogroup_border" = "rgba(282a36dd)";
        "col.nogroup_border_active" = "rgba(bd93f966)";

        # darker alternative
        #"col.active_border" = "rgba(6272a466)"; # or rgb(6272a4)
        #"col.inactive_border" = "rgba(282a3666)";
        #"col.nogroup_border" = "rgba(282a3666)";
        #"col.nogroup_border_active" = "rgba(6272a466)"; # or rgb(6272a4)
      };
      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = "3";
        workspace_swipe_distance = "130";
        workspace_swipe_cancel_ratio = "0.5";
        workspace_swipe_min_speed_to_force = "20";
        workspace_swipe_create_new = false;
      };
      group = {
        groupbar = {
          font_size = 14;
          rounding = 10;

          indicator_height = 2;
        };
      };
      input = {
        kb_layout = "us,de";
        kb_variant = "altgr-intl,";
        kb_options = "grp:alt_space_toggle";
        follow_mouse = "1";
        touchpad = {
          disable_while_typing = true;
          natural_scroll = false;
        };
      };
      layerrule = [
        "blur, gtk-layer-shell"
        "blur, logout_dialog"
        # rofi
        "blur, (rofi)"
        #"ignorezero, (rofi)"
        #"ignorealpha, (rofi)"
        #"ignorezero, (rofi)"
        "dimaround, (rofi)"
        "blur, (swayosd)"
        # waybar
        "blur, (waybar)"
        "ignorezero, (waybar)"
        # swaync
        "blur, swaync-control-center"
        "dimaround, swaync-control-center"
        "ignorezero, swaync-control-center"
        "ignorealpha 0.5, swaync-control-center"
        # swaync-noty
        "blur, swaync-notification-window"
        "ignorezero, swaync-notification-window"
        "ignorealpha 0.5, swaync-notification-window"
        # swayosd
        "blur, swayosd"
        "ignorezero, swayosd"
        "ignorealpha 0.5, swayosd"
      ];
      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        font_family = "JetBrainsMono Nerd Font Propo";
        render_unfocused_fps = "10";
        vfr = true;
      };
      monitor = "eDP-1,1920x1200@60,auto,1";
      exec-once = [
        "${pkgs.dbus}/bin/dbus-update-activation-environment --systemd --all"
        "uwsm app -- ${lib.getBin pkgs.wl-clipboard}/bin/wl-paste --watch cliphist store"
        "uwsm app -- ${lib.getExe pkgs.nextcloud-client}"
        "uwsm app -- ${lib.getExe pkgs.wvkbd} -H 600 -L 420 --hidden"
        "uwsm app -- ${lib.getExe inputs.iio-hyprland.packages.${pkgs.system}.default}"
        "uwsm app -- ${lib.getBin pkgs.udiskie}/bin/udiskie --tray"
        "uwsm app -- ${lib.getExe inputs.hyprpolkitagent.packages.${pkgs.system}.hyprpolkitagent}"
        "uwsm app -- ${lib.getBin inputs.pyprland.packages.${pkgs.system}.pyprland}/bin/pypr"
      ];

      windowrulev2 = [
        "workspace 2 silent,class:^(firefox)$"
        "workspace 2 silent,class:^(floorp)$"
        "workspace 3 silent,class:^(dev.zed.Zed)$"
        "workspace 4 silent,initialTitle:^(GNU Image Manipulation Program)$"
        "workspace 4 silent,class:^(gimp)(.*)$"
        "workspace 4 silent,class:^(krita)$"
        "workspace 7 silent,class:^(mpv)$"
        "workspace 6 silent,class:^(steam)$,title:^(Steam)$"
        "workspace 6 silent,class:^(steam)$,title:^(Steam Big Picture Mode)$"

        "opacity 0.85 0.87, class:^(rofi)$"

        "size 80%,class:^(org.kde.polkit-kde-authentication-agent-1)$title:^(Authentication Required — PolicyKit1 KDE Agent)$"
        "center,class:^(org.kde.polkit-kde-authentication-agent-1)$title:^(Authentication Required — PolicyKit1 KDE Agent)$"
        "float,class:^(org.kde.polkit-kde-authentication-agent-1)$,title:^(Authentication Required — PolicyKit1 KDE Agent)$"
        "dimaround,class:^(org.kde.polkit-kde-authentication-agent-1)$,title:^(Authentication Required — PolicyKit1 KDE Agent)$"

        "float,class:^(xdg-desktop-portal-gtk)$"
        "center,class:^(xdg-desktop-portal-gtk)$"
        "size 60%,class:^(xdg-desktop-portal-gtk)$"
        "float,class:^(xdg-desktop-portal-gtk)$,title:^(Choose where you want to move)$"
        "float,title:^(Select EXE to Run)$"

        "pseudo,class:^(steam)$,title:^(Steam Big Picture Mode)$"

        "float,title:^(Volume Control)$"
        "center,class:^(Volume Control)$"
        "size 66%,class:^(Volume Control)$"
        "float,opaque,noblur,class:^(Xdg-desktop-portal-gtk)$,title:^(Install Files)$"

        "float,title:^(Print)$"
        "center,title:^(Print)$"
        "size 50%,title:^(Print)$"
      ];
    };
  };
}

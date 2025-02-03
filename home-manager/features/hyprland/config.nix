{
  pkgs,
  inputs,
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
      };
      bindm = [
        "SUPER,mouse:272,movewindow"
        "SUPER,mouse:273,resizewindow"
      ];
      bind = [
        #"SUPER,Return,exec,${pkgs.foot}/bin/footclient"
        "SUPER,Return,exec,kitty"
        "SUPER,w,exec,${pkgs.swaynotificationcenter}/bin/swaync-client -t"
        "SUPER,p,exec,pkill -9 rofi > /dev/null 2>&1 || ${pkgs.rofi-wayland}/bin/rofi -show drun -modes drun,filebrowser,keys,window"
        "SUPER,i,exec,cliphist list | ${pkgs.rofi-wayland}/bin/rofi -dmenu | cliphist decode | wl-copy"
        ",XF86Tools,exec,pkill -USR1 waybar # profile button"
        ",Print,exec,grimblast --notify copy output"
        "SHIFT,Print,exec,grimblast --notify copy active"
        "CONTROL,Print,exec,grimblast --notify copy screen"
        "SUPER,Print,exec,grimblast --notify copy window"
        "ALT,Print,exec,grimblast --notify copy area"
        ",XF86MonBrightnessUp,exec,${pkgs.swayosd}/bin/swayosd-client --brightness raise"
        ",XF86MonBrightnessDown,exec,${pkgs.swayosd}/bin/swayosd-client --brightness lower"
        "ALT,XF86AudioRaiseVolume,exec,playerctl next"
        "ALT,XF86AudioLowerVolume,exec,playerctl previous"
        ",XF86AudioPlay,exec,playerctl play-pause"
        ",CF86AudioPause,exec,playerctl play-pause"
        ",XF86AudioStop,exec,playerctl stop"
        "ALT,XF86AudioNext,exec,playerctld shift"
        "ALT,XF86AudioPrev,exec,playerctld unshift"
        "ALT,XF86AudioPlay,exec,systemctl --user restart playerctld"
        ",XF86AudioRaiseVolume,exec,${pkgs.swayosd}/bin/swayosd-client --output-volume raise"
        ",XF86AudioLowerVolume,exec,${pkgs.swayosd}/bin/swayosd-client --output-volume lower"
        ",XF86AudioMute,exec,${pkgs.swayosd}/bin/swayosd-client --output-volume mute-toggle"
        "SHIFT,XF86AudioMute,exec,pactl set-source-mute @DEFAULT_SOURCE@ toggle"
        ",XF86AudioMicMute,exec,pactl set-source-mute @DEFAULT_SOURCE@ toggle"
        "SUPERSHIFT,q,killactive"
        "SUPERSHIFT,e,exit"
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
        "SUPER,h,movefocus,l"
        "SUPER,l,movefocus,r"
        "SUPER,k,movefocus,u"
        "SUPER,j,movefocus,d"
        "SUPERSHIFT,left,movewindow,l"
        "SUPERSHIFT,right,movewindow,r"
        "SUPERSHIFT,up,movewindow,u"
        "SUPERSHIFT,down,movewindow,d"
        "SUPERSHIFT,h,movewindow,l"
        "SUPERSHIFT,l,movewindow,r"
        "SUPERSHIFT,k,movewindow,u"
        "SUPERSHIFT,j,movewindow,d"
        "SUPERCONTROL,left,focusmonitor,l"
        "SUPERCONTROL,right,focusmonitor,r"
        "SUPERCONTROL,up,focusmonitor,u"
        "SUPERCONTROL,down,focusmonitor,d"
        "SUPERCONTROL,h,focusmonitor,l"
        "SUPERCONTROL,l,focusmonitor,r"
        "SUPERCONTROL,k,focusmonitor,u"
        "SUPERCONTROL,j,focusmonitor,d"
        "SUPERCONTROL,1,focusmonitor,eDP-1"
        "SUPERCONTROL,2,focusmonitor,DP-1"
        "SUPERCONTROLSHIFT,left,movewindow,mon:l"
        "SUPERCONTROLSHIFT,right,movewindow,mon:r"
        "SUPERCONTROLSHIFT,up,movewindow,mon:u"
        "SUPERCONTROLSHIFT,down,movewindow,mon:d"
        "SUPERCONTROLSHIFT,h,movewindow,mon:l"
        "SUPERCONTROLSHIFT,l,movewindow,mon:r"
        "SUPERCONTROLSHIFT,k,movewindow,mon:u"
        "SUPERCONTROLSHIFT,j,movewindow,mon:d"
        "SUPERCONTROLSHIFT,1,movewindow,mon:eDP-1"
        "SUPERCONTROLSHIFT,2,movewindow,mon:DP-2"
        "SUPERCONTROLSHIFT,3,movewindow,mon:DP-3"
        "SUPERALT,left,movecurrentworkspacetomonitor,l"
        "SUPERALT,right,movecurrentworkspacetomonitor,r"
        "SUPERALT,up,movecurrentworkspacetomonitor,u"
        "SUPERALT,down,movecurrentworkspacetomonitor,d"
        "SUPERALT,h,movecurrentworkspacetomonitor,l"
        "SUPERALT,l,movecurrentworkspacetomonitor,r"
        "SUPERALT,k,movecurrentworkspacetomonitor,u"
        "SUPERALT,j,movecurrentworkspacetomonitor,d"
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
      decoration = {
        active_opacity = "1.0";
        inactive_opacity = "0.8";
        fullscreen_opacity = "1.0";
        rounding = "10";
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

      env = [
        "NIXOS_OZONE_WL,1"
        "XCURSOR_SIZE,24"
        "XCURSOR_THEME,breeze_cursors"
        "GTK_THEME,catppuccin-macchiato-mauve-standard"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "MOZ_DISABLE_RDD_SANDBOX,1"
        "MOZ_ENABLE_WAYLAND,1"
        "OZONE_PLATFORM,wayland"
        "QT_QPA_PLATFORM,wayland"
        "QT_QPA_PLATFORMTHEME,qt5ct" #env = QT_STYLE_OVERRIDE,kvantum
        #"QT_STYLE_OVERRIDE,qt5ct-style"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "_JAVA_AWT_WM_NONREPARENTING,1"
      ];
      general = {
        gaps_in = "12";
        gaps_out = "16";
        border_size = "1";
        "col.active_border" = "rgb(44475a) rgb(bd93f9) 90deg";
        "col.inactive_border" = "rgba(44475aaa)";
        "col.nogroup_border" = "rgba(282a36dd)";
        "col.nogroup_border_active" = "rgb(bd93f9) rgb(44475a) 90deg";
        no_border_on_floating = true;

        # non-gradient alternative
        #col.active_border = rgb(bd93f9)
        #col.inactive_border = rgba(44475aaa)
        #col.group_border = rgba(282a36dd)
        #col.group_border_active = rgb(bd93f9)

        # darker alternative
        #col.active_border = rgb(44475a) # or rgb(6272a4)
        #col.inactive_border = rgb(282a36)
        #col.group_border = rgb(282a36)
        #col.group_border_active = rgb(44475a) # or rgb(6272a4)
      };
      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = "3";
        workspace_swipe_distance = "130";
        workspace_swipe_cancel_ratio = "0.5";
        workspace_swipe_min_speed_to_force = "20";
        workspace_swipe_create_new = false;
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
        "dimaround, (rofi)"
        # waybar
        "blur, (waybar)"
        "ignorezero, (waybar)"
        # swaync
        "blur, swaync-control-center"
        "dimaround, swaync-control-center"
        "ignorezero, swaync-control-center"
        "ignorealpha 0.5, swaync-control-center"
        # swaync-notification-window
        "blur, swaync-notification-window"
        "ignorezero, swaync-notification-window"
        "ignorealpha 0.5, swaync-notification-window"
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
        "uwsm app -- ${pkgs.wl-clipboard}/bin/wl-paste --watch cliphist store"
        "uwsm app -- ${pkgs.nextcloud-client}/bin/nextcloud"
        "uwsm app -- ${pkgs.wvkbd}/bin/wvkbd-mobintl -H 600 -L 420 --hidden"
        "uwsm app -- ${inputs.iio-hyprland.packages.${pkgs.system}.default}/bin/iio-hyprland"
        "uwsm app -- ${pkgs.udiskie}/bin/udiskie --tray"
        "uwsm app -- ${inputs.hyprpolkitagent.packages.${pkgs.system}.hyprpolkitagent}/libexec/hyprpolkitagent"
      ];
      windowrulev2 = [
        "workspace 2 silent,class:^(firefox)$"
        # polkit
        "size 80%,class:^(org.kde.polkit-kde-authentication-agent-1)$title:^(Authentication Required — PolicyKit1 KDE Agent)$"
        "center,class:^(org.kde.polkit-kde-authentication-agent-1)$title:^(Authentication Required — PolicyKit1 KDE Agent)$"
        "float,class:^(org.kde.polkit-kde-authentication-agent-1)$,title:^(Authentication Required — PolicyKit1 KDE Agent)$"
        "dimaround,class:^(org.kde.polkit-kde-authentication-agent-1)$,title:^(Authentication Required — PolicyKit1 KDE Agent)$"
        # heroic stuff
        "float,class:^(xdg-desktop-portal-gtk)$"
        "center,class:^(xdg-desktop-portal-gtk)$"
        "size 60%,class:^(xdg-desktop-portal-gtk)$"
        "float,class:^(xdg-desktop-portal-gtk)$,title:^(Choose where you want to move)$"
        "float,title:^(Select EXE to Run)$"
        # desktop-portal
        "float,class:^(xdg-desktop-portal-gtk)$"
        # mpv
        "workspace 3 silent,class:^(mpv)$"
        # steam
        "workspace 6 silent,class:^(steam)$,title:^(Steam)$"
        "workspace 6 silent,class:^(steam)$,title:^(Steam Big Picture Mode)$"
        "pseudo,class:^(steam)$,title:^(Steam Big Picture Mode)$"
        # pavucontrol
        "float,title:^(Volume Control)$"
        "center,class:^(Volume Control)$"
        "size 66%,class:^(Volume Control)$"
        "float,opaque,noblur,class:^(Xdg-desktop-portal-gtk)$,title:^(Install Files)$"
      ];
    };
  };
}

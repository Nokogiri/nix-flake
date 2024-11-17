{ pkgs, ... }:
{
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
      bind = [
        "SUPER,Return,exec,${pkgs.foot}/bin/footclient"
        #"SUPER,Return,exec,wezterm-gui start"
        "SUPER,w,exec,${pkgs.swaynotificationcenter}/bin/swaync-client -t"
        "SUPER,p,exec,pkill -9 rofi || ${pkgs.rofi-wayland}/bin/rofi -show drun -modes drun,filebrowser,keys,window"
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
        "SUPER,XF86AudioPlay,exec,$TERMINAL $SHELL -ic lyrics"
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
        blur = {
          enabled = true;
          size = "5";
          passes = "2";
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
        "XCURSOR_THEME,Dracula-cursors"
        "GTK_THEME,Dracula"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
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

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        font_family = " JetBrainsMono Nerd Font Propo";
        render_unfocused_fps = "5";
        vfr = true;
      };
      monitor = "eDP-1,1920x1200@47.999001,auto,1";
      exec-once = [
        "${pkgs.dbus}/bin/dbus-update-activation-environment --systemd --all"
        #"${pkgs.swaybg}/bin/swaybg (${pkgs.fetchurl {
        #      url = "https://lemmy.ca/pictrs/image/b82e2b77-3910-4d7c-8df8-d2c486db1669.jpeg";
        #      hash = "sha256-zLrWrMi3NSGLc686u8cDiJpJKIukBwA6pWygAT0NZmQ=";
        #    }}) fill"
      ];
    };
    extraConfig = ''
        # Startup
        exec-once = ${pkgs.dbus}/bin/dbus-update-activation-environment --systemd --all
        exec-once = ${pkgs.wl-clipboard}/bin/wl-paste --watch cliphist store

        # Mouse binding
        bindm=SUPER,mouse:272,movewindow
        bindm=SUPER,mouse:273,resizewindow


        windowrulev2 = workspace 2 silent,class:^(firefox)$


        # polkit
        windowrulev2 = size 80%,class:^(org.kde.polkit-kde-authentication-agent-1)$title:^(Authentication Required — PolicyKit1 KDE Agent)$
        windowrulev2 = center,class:^(org.kde.polkit-kde-authentication-agent-1)$title:^(Authentication Required — PolicyKit1 KDE Agent)$
        windowrulev2 = float,class:^(org.kde.polkit-kde-authentication-agent-1)$,title:^(Authentication Required — PolicyKit1 KDE Agent)$

        # heroic stuff
        windowrulev2 = float,class:^(electron)$,title:^(Select Executable)$
        windowrulev2 = center,class:^(electron)$,title:^(Select Executable)$
        windowrulev2 = size 60%,class:^(electron)$,title:^(Select Executable)$

        windowrulev2 = center,class:^(xdg-desktop-portal-gtk)$title:^(Open With…)$
        windowrulev2 = float,center,size=60%,title:^(.*Picture-in-Picture.*)$,class:^(firefox)$

        # mpv
        windowrulev2 = workspace 3 silent,class:^(mpv)$

        # steam
        windowrulev2 = workspace 6 silent,class:^(steam)$,title:^(Steam)$
        windowrulev2 = workspace 6 silent,class:^(steam)$,title:^(Steam Big Picture Mode)$
        windowrulev2 = pseudo,class:^(steam)$,title:^(Steam Big Picture Mode)$

        # pavucontrol
        windowrulev2 = float,class:^(pavucontrol)$
        windowrulev2 = center,class:^(pavucontrol)$
        windowrulev2 = size 66%,class:^(pavucontrol)$

        windowrulev2 = float,title:^(Select EXE to Run)$

        windowrulev2 = float,opaque,noblur,class:^(Xdg-desktop-portal-gtk)$,title:^(Install Files)$

        #windowrulev2 = forceinput,class:^(.gamescope-wrapped)$

        windowrulev2 = nomaxsize,class:^(com.github.xournalpp.xournalpp)$
        layerrule=blur, gtk-layer-shell
        layerrule = blur, logout_dialog

      layerrule = blur, class:^(swww)$
      layerrule = blur, (rofi)
      layerrule = blur, (waybar)

      layerrule = blur, swaync-control-center
      layerrule = blur, swaync-notification-window

      # Tweaks to work with blur -----------------------------------

      #layerrule = unset, (rofi)
      #layerrule = ignorezero, (rofi)

      #layerrule = unset, (swaync-control-center)
      layerrule = ignorezero, swaync-control-center
      layerrule = ignorezero, swaync-notification-window

      layerrule = ignorealpha 0.5, swaync-control-center
      layerrule = ignorealpha 0.5, swaync-notification-window

        # Center Stuff
        windowrulev2 = center,class:^(heroic)$,title:^(Exit)$
        windowrulev2 = center,class:^(gimp-2.99)$,floating:1
        windowrulev2 = center,class:^(file-*),title:^(Export Image as*),floating:1
        windowrulev2 = center,title:^(Really Quit*),floating:1

        # misc
        #windowrulev2 = stayfocused, title:^(Steam)$, class:^(steam)$

    '';
  };
}

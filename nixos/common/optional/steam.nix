{pkgs, ...}: {
  programs.gamemode = {
    enable = true;
    enableRenice = true;
    settings = {
      general = {
        renice = 10;
      };
      # Warning: GPU optimisations have the potential to damage hardware
      gpu = {
        apply_gpu_optimisations = "accept-responsibility";
        gpu_device = 1;
        amd_performance_level = "high";
      };

      custom = {
        start = ''
          ${pkgs.libnotify}/bin/notify-send 'GameMode started'
                          ${pkgs.power-profiles-daemon}/bin/powerprofilesctl set performance
        '';
        end = ''
          ${pkgs.libnotify}/bin/notify-send 'GameMode ended'
                          ${pkgs.power-profiles-daemon}/bin/powerprofilesctl set balanced
        '';
      };
    };
  };

  programs.steam = {
    enable = true;
    extest.enable = true;
    gamescopeSession = {
      enable = true;
    };
    protontricks.enable = true;
    remotePlay.openFirewall = true;
    extraPackages = with pkgs; [
      xorg.libXcursor
      xorg.libXi
      xorg.libXinerama
      xorg.libXScrnSaver
      libpng
      libvorbis
      stdenv.cc.cc.lib
      SDL2
      openal
      libkrb5
      keyutils
      mangohud
      nss
      (writeShellScriptBin "launch-gamescope" ''
        if [ -z "$WAYLAND_DISPLAY" ]; then
          exec nice -n -10 -- gamescope "$@"
        else
          exec env LD_PRELOAD="" nice -n -10 -- gamescope -e "$@"
        fi
      '')
    ];
  };

  programs.gamescope = {
    enable = true;
    capSysNice = false;
    args = [
      "-W 1920"
      "-H 1200"
      "-w 1472"
      "-h 920"
      "-F fsr"
      "--fsr-sharpness 10"
      "-f"
    ];
  };
}

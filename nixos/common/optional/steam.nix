{ pkgs, ... }:
{
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
        gpu_device = 0;
        amd_performance_level = "high";
      };

      custom = {
        start = ''${pkgs.libnotify}/bin/notify-send 'GameMode started' 
                ${pkgs.power-profiles-daemon}/bin/powerprofilesctl set performance'';
        end = ''${pkgs.libnotify}/bin/notify-send 'GameMode ended' 
                ${pkgs.power-profiles-daemon}/bin/powerprofilesctl set balanced'';
      };
    };
  };

  programs.steam = {
    enable = true;
    extest.enable = true;
    protontricks.enable = true;
    remotePlay.openFirewall = true;
    extraCompatPackages = with pkgs; [
      #proton-ge-bin
      steamtinkerlaunch
    ];
  };
  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };
}

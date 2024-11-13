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
        gpu_device = 1;
        amd_performance_level = "high";
      };

      custom = {
        start = ''
          ${pkgs.libnotify}/bin/notify-send 'GameMode started' 
          ${pkgs.power-profiles-daemon}/bin/powerprofilesctl set performance
          ${pkgs.ryzen-ppd}/bin/ryzen-ppd'';
        end = ''
          ${pkgs.libnotify}/bin/notify-send 'GameMode ended' 
          ${pkgs.power-profiles-daemon}/bin/powerprofilesctl set balanced
          ${pkgs.procps}/bin/pkill -9 ryzen-ppd'';
      };
    };
  };

  programs.steam = {
    enable = true;
    extest.enable = true;
    protontricks.enable = true;
    remotePlay.openFirewall = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
      #steamtinkerlaunch
    ];
    #extraPackages = with pkgs; [
    #  gamemode
    #];
  };
  programs.gamescope = {
    enable = true;
    capSysNice = false;
    args = [
      "-W 1920"
      "-H 1200"
      "-w 1280"
      "-h 800"
      "-F fsr"
      "--fsr-sharpness 10"
      "-f"
    ];
  };
}

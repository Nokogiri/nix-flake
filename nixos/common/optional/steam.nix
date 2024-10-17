{ pkgs, ... }:
{
  programs.gamemode = {
    enable = true;
    enableRenice = true;
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
    capSysNice = false;
  };
}

{ pkgs, ... }:
{
  programs.gamemode = {
    enable = true;
    enableRenice = true;
  };

  programs.steam = {
    enable = true;
    extest.enable = true;
    extraPackages = with pkgs; [
      gst_all_1.gst-vaapi
      gst_all_1.gst-plugins-good
      gst_all_1.gst-plugins-bad
      gst_all_1.gst-plugins-ugly
      gst_all_1.gst-libav
      gamescope
      gamemode
      fribidi
      mangohud
      libgdiplus
      brotli.lib
      zlib
      libpulseaudio
      libvorbis
      stdenv.cc.cc.lib
      SDL2
      libkrb5
      keyutils
      xdg-user-dirs
      wget
      yad
      libsoundio
      steam-rom-manager
      steamtinkerlaunch
      xdotool
      xorg.xprop
      xorg.xwininfo
      unixtools.xxd
      pev
      zenity
    ];
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

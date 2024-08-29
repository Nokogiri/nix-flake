{ pkgs, ... }:
{
  home.packages = with pkgs; [
    wineWowPackages.stableFull
    #bottles
    attr
    gst_all_1.gst-vaapi
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-libav
    libgdiplus
    fribidi
    mangohud
    mono
    nss
    xorg.libXcursor
    xorg.libXi
    xorg.libXinerama
    xorg.libXScrnSaver
    xorg.libXdmcp
    xorg.libXau
    libpng
    gtk3
    gtk3-x11
    libgdiplus
    zlib
    libpulseaudio
    libvorbis
    stdenv.cc.cc.lib
    SDL2
    libkrb5
    keyutils
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-plugins-bad
    xdg-user-dirs
    unixtools.xxd
    wget
    winetricks
    xdotool
    xorg.xprop
    xorg.xwininfo
    yad
  ];
}

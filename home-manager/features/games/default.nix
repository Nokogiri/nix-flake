{pkgs, ...}: {
  imports = [
    ./mangohud
  ];

  home.sessionVariables.WINEDEBUG = "-all";

  home.packages = with pkgs; [
    mangohud
    heroic
    innoextract

    #arx-libertatis
    #eduke32
    #gemrb
    #gzdoom
    #vintagestory

    #portmod
    cemu
    pcsx2
    ppsspp

    #gfn-electron

    #wineWowPackages.waylandFull
    #stl
    wget
    xdotool
    xorg.xprop
    xorg.xrandr
    xorg.xwininfo
    xxd
    yad
  ];
}

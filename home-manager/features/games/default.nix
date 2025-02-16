{pkgs, ...}: {
  imports = [
    ./mangohud
    ./stl.nix
  ];

  home.sessionVariables.WINEDEBUG = "-all";

  home.packages = with pkgs; [
    mangohud
    heroic
    innoextract

    #arx-libertatis
    eduke32
    gemrb
    #gzdoom
    #uhexen2
    vintagestory
    
    #portmod
    #cemu
    pcsx2
    #ppsspp

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

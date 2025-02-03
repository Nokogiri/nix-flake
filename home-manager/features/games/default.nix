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

    arx-libertatis
    gemrb
    gzdoom
    vintagestory

    cemu
    pcsx2
    ppsspp

    gfn-electron

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

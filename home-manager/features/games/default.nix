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

    gzdoom
    vintagestory

    cemu
    pcsx2
    ppsspp

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

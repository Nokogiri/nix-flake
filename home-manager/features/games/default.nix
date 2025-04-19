{pkgs, ...}: {
  imports = [
    ./mangohud
  ];

  home.sessionVariables.WINEDEBUG = "-all";

  home.packages = with pkgs; [
    mangohud
    heroic
    innoextract

    arx-libertatis
    eduke32
    gemrb
    gzdoom
    summoning-pixel-dungeon
    shattered-pixel-dungeon
    shorter-pixel-dungeon
    experienced-pixel-dungeon
    vintagestory

    portmod
    cemu
    pcsx2
    ppsspp

    #gfn-electron

    #wineWowPackages.waylandFull
    #stl
    #bottles
    #wget
    #xdotool
    #xorg.xprop
    #xorg.xrandr
    #xorg.xwininfo
    #xxd
    #yad
  ];
}

{pkgs, ...}: {
  imports = [
    ./mangohud
  ];

  home.sessionVariables.WINEDEBUG = "-all";

  home.packages = with pkgs; [
    mangohud
    heroic
    innoextract

    dhewm3
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
  ];
}

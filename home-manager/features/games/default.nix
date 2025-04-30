{pkgs, ...}: {
  imports = [
    ./mangohud
  ];

  home.sessionVariables.WINEDEBUG = "-all";

  home.packages = with pkgs; [
    mangohud
    heroic
    innoextract

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

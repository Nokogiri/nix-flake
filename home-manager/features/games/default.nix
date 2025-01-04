{pkgs, ...}: {
  imports = [
    ./mangohud
  ];

  home.sessionVariables.WINEDEBUG = "-all";

  home.packages = with pkgs; [
    mangohud
    heroic

    gzdoom
    vintagestory

    cemu
    pcsx2
    ppsspp
  ];
}

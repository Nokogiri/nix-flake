{ pkgs, ... }:
{
  imports = [
    ./mangohud
  ];

  home.sessionVariables.WINEDEBUG = "-all";

  home.packages = with pkgs; [
    mangohud
    heroic
    google-chrome # GFN

    gzdoom
    vintagestory

    # emulation
    ares
    lime3ds
    dolphin-emu-beta
    pcsx2
    ppsspp
  ];
}

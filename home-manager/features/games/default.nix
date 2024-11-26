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
    cemu
    dolphin-emu-beta
    lime3ds
    pcsx2
    ppsspp
    retroarchFull
  ];
}

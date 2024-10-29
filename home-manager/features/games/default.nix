{ pkgs, inputs, ... }:
{
  imports = [
    ./mangohud
    ./stl.nix
    #./wine.nix
  ];

  home.sessionVariables.WINEDEBUG = "-all";

  home.packages = with pkgs; [
    mangohud
    vkbasalt
    heroic
    google-chrome # GFN

    gzdoom
    sm64ex
    vintagestory
    # emulation
    cemu
    ares
    melonDS
    #lime3ds
    dolphin-emu-beta
    pcsx2
    ppsspp
  ];
}

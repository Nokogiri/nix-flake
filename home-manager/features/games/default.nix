{ pkgs, inputs, ... }:
{
  imports = [
    ./mangohud.nix
    ./stl.nix
    #./wine.nix
  ];

  home.sessionVariables.WINEDEBUG = "-all";

  home.packages = with pkgs; [
    mangohud
    vkbasalt
    heroic
    google-chrome # GFN
    inputs.stable.legacyPackages.x86_64-linux.portmod


    gzdoom
    sm64ex
    #minetest
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

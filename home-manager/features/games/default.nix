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

    gzdoom
    sm64ex
    minetest

    # emulation
    dotnet-runtime_7
    cemu
    ares
    melonDS
    #lime3ds
    dolphin-emu-beta
    pcsx2
    ppsspp
  ];
}

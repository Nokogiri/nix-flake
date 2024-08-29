{ pkgs, ... }:
{
  imports = [
    ./mangohud.nix
    ./stl.nix
    ./wine.nix
  ];

  home.sessionVariables.WINEDEBUG = "-all";

  home.packages = with pkgs; [

    gamescope
    mangohud

    vkbasalt
    heroic
    google-chrome # GFN

    gzdoom
    sm64ex

    # emulation
    #cemu
    dolphinEmuMaster
    libretro.citra
    libretro.mgba
    libretro.mupen64plus
    libretro.parallel-n64
    libretro.play
    libretro.snes9x
    pcsx2
    ppsspp
    ryujinx
  ];
}

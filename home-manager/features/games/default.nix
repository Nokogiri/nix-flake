{ inputs, pkgs, ... }:
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

    #vkbasalt
    heroic
    inputs.umu.packages.${pkgs.system}.umu
    google-chrome # GFN

    gzdoom
    #sm64ex

    # emulation
    #cemu
    dolphinEmuMaster
    #retroarch
    #libretro.beetle-psx-hw
    libretro.citra
    #libretro.dolphin
    #libretro.flycast
    libretro.mgba
    libretro.mupen64plus
    libretro.parallel-n64
    libretro.play
    #libretro.ppsspp
    libretro.snes9x
    pcsx2
    ppsspp
    #rpcs3
    ryujinx
  ];
}

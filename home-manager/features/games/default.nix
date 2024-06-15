{ pkgs, inputs, ... }:
{
  imports = [
    ./mangohud.nix
    ./steam.nix
    ./wine.nix
  ];

  home.sessionVariables.WINEDEBUG = "-all";

  home.packages = with pkgs; [

    dwarfs
    fuse-overlayfs
    psmisc
    bubblewrap

    gamescope
    mangohud
    vkbasalt
    heroic

    gzdoom
    sm64ex

    # emulation
    #inputs.umu.packages.${pkgs.system}.umu
    cemu
    dolphinEmuMaster
    retroarch
    libretro.beetle-psx-hw
    libretro.citra
    libretro.dolphin
    libretro.flycast
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

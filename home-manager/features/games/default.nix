{ inputs, pkgs, ... }:
{
  imports = [
    ./mangohud.nix
    ./steam.nix
    ./wine.nix
  ];

  home.sessionVariables.WINEDEBUG = "-all";

  home.packages = with pkgs; [

    inputs.umu.packages.${pkgs.system}.umu

    dwarfs
    fuse-overlayfs
    psmisc
    bubblewrap

    gamescope
    mangohud
    vkbasalt
    heroic

    #dhewm3
    #rbdoom-3-bfg
    gzdoom
    sm64ex
    #vkquake
    #yquake2
    #yquake2-all-games

    # emulation
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
    rpcs3
    ryujinx
  ];
}

{ inputs, pkgs, ... }:
{
  imports = [
    ./mangohud
  ];

  home.sessionVariables.WINEDEBUG = "-all";

  home.packages = with pkgs; [
    mangohud
    #vkbasalt
    heroic
    google-chrome # GFN

    gzdoom
    sm64ex
    vintagestory
    # emulation
    #cemu
    #inputs.nixpkgs-master.legacyPackages.x86_64-linux.cemu
    ares
    melonDS
    lime3ds
    dolphin-emu-beta
    pcsx2
    ppsspp
  ];
}

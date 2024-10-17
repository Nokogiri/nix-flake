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

    #vkbasalt
    heroic
    google-chrome # GFN

    gzdoom
    sm64ex
    minetest

    #openmw
    inputs.stable.legacyPackages.x86_64-linux.portmod

    # emulation
    dotnet-runtime_7
    cemu
    ares
    melonDS
    #lime3ds
    dolphinEmuMaster
    pcsx2
    ppsspp
  ];
}

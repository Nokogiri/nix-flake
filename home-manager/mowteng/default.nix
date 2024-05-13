{ inputs, pkgs, ... }:
{
  imports = [
    ../global
    ../features/cli/nix-stuff.nix
    ../features/desktop
    ../features/games
    ../features/media
    ../features/nvim
    ../../stylix/home.nix
    ../features/sway
    inputs.nur.nixosModules.nur
  ];

  services.mpris-proxy.enable = true;
  home.packages = with pkgs; [
    handlr-regex

    appimage-run
    transmission_4-qt6
    xournalpp

    gimp
    krita
    mypaint
  ];
}

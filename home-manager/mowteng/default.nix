{ inputs, pkgs, ... }:
{
  imports = [
    ../global
    ../features/cli/nix-stuff.nix
    ../features/desktop
    ../features/games
    ../features/media
    ../features/nvim
    ../../stylix/mowteng/home.nix
    #../features/sway
    ../features/hyprland
    inputs.nur.nixosModules.nur
  ];

  home.packages = with pkgs; [
    handlr-regex
    xournalpp
    gimp
    krita
  ];
}

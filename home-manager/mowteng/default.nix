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
    ../features/sway
    ../features/awesome
    ../features/bspwm
    #../features/hyprland
    inputs.nur.nixosModules.nur
  ];

  #nixpkgs.overlays = [ inputs.nixpkgs-wayland.overlay ];

  services.mpris-proxy.enable = true;
  home.packages = with pkgs; [
    handlr-regex

    appimage-run
    transmission-qt
    xournalpp

    gimp
    krita
    mypaint
  ];
}

{ inputs, pkgs, ... }:
{
  imports = [
    ./config.nix
    ./environment.nix
    ./hyprlock.nix
    ./hypridle.nix
    ./user-services.nix
    ./waybar
    ../desktop/wayland.nix
    inputs.hyprland.homeManagerModules.default
  ];

  nixpkgs.overlays = [
    inputs.hyprland-contrib.overlays.default
  ];

  home.packages = with pkgs; [
    hyprpicker
    hyprpaper
    #hyprshade
    grimblast
    hyprprop
    iio-hyprland
    scratchpad
    wayfreeze
  ];

  programs.waybar = {
    systemd = {
      enable = true;
      target = "hyprland-session.target";
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };
  };
}

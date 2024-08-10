{ inputs, pkgs, ... }:
{
  imports = [
    #./hyprpaper
    ./config.nix
    #./hy3land.nix
    ./environment.nix
    ./hyprlock.nix
    ./hypridle.nix
    ./plugins
    #./swaync.nix
    ./swayosd.nix
    ./user-services.nix
    ./waybar
    ../desktop/wayland.nix
    #./wlogout.nix
    inputs.hyprland.homeManagerModules.default
  ];

  nixpkgs.overlays = [
    inputs.hyprland-contrib.overlays.default
    #inputs.hyprlock.overlays.default
  ];

  home.packages = with pkgs; [
    hyprpicker
    hyprpaper
    grimblast
    hyprprop
    #iio-hyprland
    inputs.iio-hyprland.packages.${pkgs.system}.default
    scratchpad
  ];

  #programs = {
  #  fish.loginShellInit = ''
  #    if test (tty) = "/dev/tty1"
  #      exec systemd-cat --identifier=Hyprland Hyprland &> /dev/null
  #    end
  #  '';
  #};

  programs.waybar = {
    systemd = {
      enable = true;
      target = "hyprland-session.target";
    };
  };

  wayland.windowManager.hyprland = {
    #package = inputs.hyprland.packages.x86_64-linux.hyprland;
    #package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    enable = true;
    xwayland = {
      enable = true;
    };
  };
}

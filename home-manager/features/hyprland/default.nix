{ inputs, pkgs, ... }:
{
  imports = [
    ./hyprpaper
    ./config.nix
    #./hy3land.nix
    ./environment.nix
    ./hyprlock.nix
    ./hypridle.nix
    ./plugins
    ./swaync.nix
    ./swayosd.nix
    ./user-services.nix
    ./waybar
    ../desktop/wayland.nix
  ];

  nixpkgs.overlays = [ inputs.hyprland-contrib.overlays.default ];

  home.packages = with pkgs; [
    inputs.iio-hyprland.packages.${pkgs.system}.default
    hyprpicker
    grimblast
    cliphist
    hyprprop
    scratchpad
  ];

  programs = {
    fish.loginShellInit = ''
      if test (tty) = "/dev/tty1"
        exec systemd-cat --identifier=Hyprland Hyprland &> /dev/null
      end
    '';
  };

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

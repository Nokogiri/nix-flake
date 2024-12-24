{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./config.nix
    ./environment.nix
    ./hyprlock.nix
    ./hypridle.nix
    ./user-services.nix
    ./waybar
    ../desktop/wayland.nix
  ];

  nixpkgs.overlays = [
    #inputs.hyprland.overlays.default
    inputs.hyprland-contrib.overlays.default
    inputs.hyprland-qtutils.overlays.default
  ];

  home.packages = with pkgs; [
    hyprland-qtutils
    hyprpicker
    hyprpaper
    hyprpolkitagent
    grimblast
    hyprprop
    scratchpad
  ];

  programs.waybar = {
    systemd = {
      enable = true;
      target = "hyprland-session.target";
    };
  };

  wayland.windowManager.hyprland = {
    package = pkgs.hyprland;
    #package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    enable = true;
    xwayland = {
      enable = true;
    };
  };
}

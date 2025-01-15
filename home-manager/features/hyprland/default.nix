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
  ];

  nixpkgs.overlays = [
    inputs.hyprland.overlays.default
    inputs.hyprland-contrib.overlays.default
    inputs.hyprland-qtutils.overlays.default
  ];

  home.packages = with pkgs;
  with inputs.hyprland-contrib.packages.${pkgs.system}; [
    hyprpicker
    hyprpaper
    inputs.hyprpolkitagent.packages.${pkgs.system}.hyprpolkitagent
    grimblast
    hyprprop
    scratchpad
    kdePackages.qqc2-breeze-style
  ];

  programs.waybar = {
    systemd = {
      enable = true;
      target = "hyprland-session.target";
    };
  };

  wayland.windowManager.hyprland = {
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    enable = true;
    xwayland = {
      enable = true;
    };
  };
}

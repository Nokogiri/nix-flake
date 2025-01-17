{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./config.nix
    ./environment.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    #./user-services.nix
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
    imv
    inputs.hyprpolkitagent.packages.${pkgs.system}.hyprpolkitagent
    kdePackages.qqc2-breeze-style
    grimblast
    hyprprop
    scratchpad
    swayimg
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

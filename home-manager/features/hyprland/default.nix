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
    ./wlogout.nix
    ./waybar
  ];

  home.packages = with pkgs;
  with inputs.hyprland-contrib.packages.${pkgs.system}; [
    hyprpicker
    imv
    inputs.hyprpolkitagent.packages.${pkgs.system}.hyprpolkitagent
    kdePackages.qqc2-breeze-style
    grimblast
    hyprprop
    inputs.pyprland.packages.${pkgs.system}.pyprland
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

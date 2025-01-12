{
  pkgs,
  lib,
  ...
}: {
  services.xserver = {
    displayManager.gdm.enable = true;
    displayManager.gdm.wayland = true;
    desktopManager.gnome.enable = true;
  };

  services.gnome.gnome-keyring.enable = true;
  services.orca.enable = lib.mkForce false;
  environment = {
    gnome.excludePackages = with pkgs; [
      orca
      gnome-2048
      gnome-chess
      gnome-tour
      gnome-user-docs
    ];
  };
  environment.systemPackages =
    #with pkgs;
    with pkgs.gnomeExtensions; [
      appindicator
      blur-my-shell
      #gjs-osk
      #guillotine
      #paperwm
      pipewire-settings
      pipewire-airplay-toggle
      pip-on-top
      spotify-tray
      spotify-controls
      pop-shell
      screen-rotate
      #enhanced-osk
      #touch-x
    ];
}

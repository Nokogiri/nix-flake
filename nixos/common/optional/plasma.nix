{
  pkgs,
  inputs,
  ...
}: {
  services.desktopManager.plasma6.enable = true;

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
    khelpcenter
    konsole
    krdp
    xwaylandvideobridge
    plasma-browser-integration
  ];

  environment.systemPackages = with pkgs; [
    albert
    catppuccin-gtk
    catppuccin-kde
    catppuccin-sddm
    catppuccin-papirus-folders
    inputs.kwin-effects-forceblur.packages.${pkgs.system}.default
    inputs.kwin-gestures.packages.${pkgs.system}.default
    inputs.lightly.packages.${pkgs.system}.darkly-qt5
    inputs.lightly.packages.${pkgs.system}.darkly-qt6
    #kdePackages.qtstyleplugin-kvantum
    kde-rounded-corners
    kdePackages.breeze-gtk
    krohnkite
    kwin-effects-geometry-change
    maliit-keyboard
    libsForQt5.breeze-gtk
    #libsForQt5.krunner-symbols
    panel-system-info
    plasma-panel-colorizer
    plasma-window-title-applet
  ];
}

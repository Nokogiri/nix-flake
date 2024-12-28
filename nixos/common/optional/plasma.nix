{ pkgs, inputs, ... }:{

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
    inputs.kwin-effects-forceblur.packages.${pkgs.system}.default
    inputs.lightly.packages.${pkgs.system}.darkly-qt5
    inputs.lightly.packages.${pkgs.system}.darkly-qt6
    kdePackages.qtstyleplugin-kvantum
    klassy
    krohnkite
    kwin-effects-geometry-change 
    panel-system-info
    plasma-panel-colorizer
    plasma-window-title-applet
  ];
}

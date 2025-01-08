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
    (catppuccin-gtk.override {
      variant = "frappe";
      accents = ["mauve"];
    })
    (catppuccin-kde.override {
      flavour = ["frappe"];
      accents = ["mauve"];
    })
    (catppuccin-papirus-folders.override {
      flavor = "frappe";
      accent = "mauve";
    })
    catppuccin-sddm
    inputs.kwin-effects-forceblur.packages.${pkgs.system}.default
    inputs.lightly.packages.${pkgs.system}.darkly-qt5
    inputs.lightly.packages.${pkgs.system}.darkly-qt6
    klassy
    krohnkite
    kwin-effects-geometry-change
  ];
}

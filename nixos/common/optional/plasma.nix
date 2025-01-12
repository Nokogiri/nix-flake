{
  pkgs,
  inputs,
  ...
}: {
  environment = {
    plasma6.excludePackages = with pkgs.kdePackages; [
      baloo
      baloo-widgets
      elisa
      kate
      khelpcenter
      konsole
      krdp
      plasma-browser-integration
      xwaylandvideobridge
    ];

    systemPackages = with pkgs; [
      albert
      aspell
      aspellDicts.de
      aspellDicts.en
      aspellDicts.en-computers
      aspellDicts.en-science
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
      #inputs.lightly.packages.${pkgs.system}.darkly-qt5
      #inputs.lightly.packages.${pkgs.system}.darkly-qt6
      kdePackages.plasma-vault
      klassy
      krohnkite
      kwin-effects-geometry-change
    ];
  };

  services.desktopManager.plasma6.enable = true;
}

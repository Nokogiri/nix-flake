{
  inputs,
  pkgs,
  ...
}: {
  security.pam.services.swaylock.fprintAuth = true;
  security.pam.services.hyprlock = {};

  gtk.iconCache.enable = true;

  programs = {
    dconf.enable = true;
  };

  environment.systemPackages = with pkgs; [
    dracula-theme
    (papirus-icon-theme.override {color = "black";})
    libsForQt5.qt5ct
    qt6Packages.qt6ct
    libsForQt5.qtstyleplugin-kvantum
    qt6Packages.qtstyleplugin-kvantum
    kdePackages.qtstyleplugin-kvantum
  ];

  fonts = {
    packages = with pkgs; [
      dejavu_fonts
      intel-one-mono
      jetbrains-mono
      noto-fonts
      noto-fonts-emoji
      noto-fonts-cjk-sans
      material-symbols
      weather-icons
      nerd-fonts.intone-mono
      nerd-fonts.jetbrains-mono
      nerd-fonts.symbols-only
    ];
    enableDefaultPackages = true;
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    fontconfig = {
      enable = true;
      antialias = true;
      defaultFonts = {
        serif = ["IntoneMono Nerd Font Propo"];
        sansSerif = ["IntoneMono Nerd Font Propo"];
        monospace = ["IntoneMono Nerd Font"];
        emoji = ["Noto Color Emoji"];
      };
    };
  };
  programs = {
    hyprland = {
      enable = true;
    };
    iio-hyprland = {
      enable = true;
      package = inputs.iio-hyprland.packages.${pkgs.system}.default;
    };
  };
  qt = {
    enable = true;
    style = "kvantum";
    platformTheme = "qt5ct";
  };

  # better for steam proton games
  systemd.extraConfig = "DefaultLimitNOFILE=1048576";

  services = {
    dbus = {
      enable = true;
      packages = [pkgs.gcr];
    };
    flatpak.enable = false;
    printing.enable = true;
    udisks2.enable = true;
    upower.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      #pkgs.xdg-desktop-portal-wlr
    ];
    xdgOpenUsePortal = false;
    config.common = {
      default = [
        "hyprland"
        "gtk"
      ];
      "org.freedesktop.impl.portal.Settings" = ["gtk"];
    };
  };
  environment.pathsToLink = [
    "/libexec"
    "/share/Kvantum"
    "/share/themes"
    "/share/icons"
  ];

  environment.sessionVariables = {
    BROWSER = "${pkgs.firefox}/bin/firefox";
    DISABLE_QT5_COMPAT = "0";
    NO_AT_BRIDGE = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    MOZ_USE_XINPUT2 = "1";
  };
}

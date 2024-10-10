{ inputs, pkgs, ... }:
{

  #imports = [
  #  inputs.hyprland.nixosModules.default
  #];

  security.pam.services.swaylock.fprintAuth = true;
  security.pam.services.hyprlock = { };

  gtk.iconCache.enable = true;

  programs = {
    dconf.enable = true;
  };

  environment.systemPackages = with pkgs; [
    xfce.thunar
    distrobox
    dracula-theme
    libsForQt5.qt5ct
    qt6Packages.qt6ct
    libsForQt5.qtstyleplugin-kvantum
    qt6Packages.qtstyleplugin-kvantum
  ];

  fonts = {
    packages = with pkgs; [
      dejavu_fonts
      jetbrains-mono
      noto-fonts
      noto-fonts-emoji
      noto-fonts-cjk-sans
      material-symbols
      weather-icons
      (nerdfonts.override {
        fonts = [
          "NerdFontsSymbolsOnly"
          "JetBrainsMono"
        ];
      })
    ];
    enableDefaultPackages = true;
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    fontconfig = {
      enable = true;
      antialias = true;
    };
  };

  # better for steam proton games
  systemd.extraConfig = "DefaultLimitNOFILE=1048576";
  

  services = {
    dbus = {
      enable = true;
      packages = [ pkgs.gcr ];
    };
    flatpak.enable = true;
    printing.enable = true;
    udisks2.enable = true;
    upower.enable = true;
  };
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      #pkgs.xdg-desktop-portal-hyprland
    ];
    xdgOpenUsePortal = false;
    config.common = {
      default = [
        "wlr"
        "gtk"
      ];
      "org.freedesktop.impl.portal.Settings" = [ "gtk" ];
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
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    MOZ_USE_XINPUT2 = "1";
  };
}

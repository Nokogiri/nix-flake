{pkgs, ...}: {
  gtk.iconCache.enable = true;

  programs = {
    dconf.enable = true;
  };

  environment.systemPackages = with pkgs; [
    dracula-theme
    (papirus-icon-theme.override {color = "black";})
    #libsForQt5.qt5ct
    #qt6Packages.qt6ct
    #kdePackages.sddm-kcm
    #libsForQt5.qtstyleplugin-kvantum
    #qt6Packages.qtstyleplugin-kvantum
    vintagestory
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
  # better for steam proton games
  systemd.extraConfig = "DefaultLimitNOFILE=1048576";

  services = {
    dbus = {
      enable = true;
      packages = [pkgs.gcr];
    };
    flatpak.enable = true;
    printing.enable = true;
    udisks2.enable = true;
    upower.enable = true;
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

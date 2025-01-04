{pkgs, ...}: {
  gtk.iconCache.enable = true;

  programs = {
    dconf.enable = true;
  };

  fonts = {
    packages = with pkgs; [
      dejavu_fonts
      jetbrains-mono
      noto-fonts
      noto-fonts-emoji
      noto-fonts-color-emoji
      noto-fonts-cjk-sans
      material-symbols
      weather-icons
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
        serif = ["JetBrains Mono Nerd Font"];
        sansSerif = ["JetBrains Mono Nerd Font"];
        monospace = ["JetBrains Mono Nerd Font"];
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

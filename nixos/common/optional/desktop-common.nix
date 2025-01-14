{
  pkgs,
  inputs,
  ...
}: {
  environment = {
    pathsToLink = [
      "/libexec"
      "/share/Kvantum"
      "/share/themes"
      "/share/icons"
    ];
    sessionVariables = {
      BROWSER = "${pkgs.firefox}/bin/firefox";
      DISABLE_QT5_COMPAT = "0";
      NO_AT_BRIDGE = "1";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      MOZ_USE_XINPUT2 = "1";
      KWIN_DRM_DISABLE_TRIPLE_BUFFERING = "1";
    };
  };

  fonts = {
    packages = with pkgs; [
      dejavu_fonts
      intel-one-mono
      font-awesome
      noto-fonts
      noto-fonts-emoji
      #noto-fonts-color-emoji
      #noto-fonts-emoji-blob-bin
      noto-fonts-monochrome-emoji
      noto-fonts-cjk-sans
      material-symbols
      weather-icons
      nerd-fonts.intone-mono
      nerd-fonts.symbols-only
    ];
    enableDefaultPackages = true;
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    fontconfig = {
      enable = true;
      antialias = false;
      defaultFonts = {
        serif = ["Intel One Mono"];
        sansSerif = ["Intel One Mono"];
        monospace = ["IntoneMono Nerd Font Mono"];
        emoji = ["Noto Emoji"];
      };
      hinting = {
        style = "slight";
      };
      subpixel = {
        lcdfilter = "none";
        rgba = "rgb";
      };
      useEmbeddedBitmaps = true;
    };
  };

  gtk.iconCache.enable = true;

  programs = {
    dconf.enable = true;
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      withUWSM = true;
    };
  };

  services = {
    avahi = {
      enable = true;
    };
    dbus = {
      enable = true;
      implementation = "broker";
      packages = [pkgs.gcr];
    };
    flatpak.enable = true;
    geoclue2.enable = true;
    printing.enable = true;
    udisks2.enable = true;
    upower.enable = true;
  };

  systemd = {
    extraConfig = "DefaultLimitNOFILE=1048576";
    services = {
      "getty@tty1".enable = false;
      "autovt@tty1".enable = false;
    };
  };
}

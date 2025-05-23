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
      BROWSER = "${pkgs.floorp}/bin/floorp";
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
      noto-fonts
      noto-fonts-emoji
      noto-fonts-monochrome-emoji
      noto-fonts-cjk-sans
      material-symbols
      weather-icons
      nerd-fonts.im-writing
      nerd-fonts.intone-mono
      nerd-fonts.jetbrains-mono
      nerd-fonts.symbols-only
    ];
    enableDefaultPackages = true;
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    fontconfig = {
      enable = true;
      antialias = false;
      defaultFonts = {
        serif = ["JetBrainsMono Nerd Font"];
        sansSerif = ["JetBrainsMono Nerd Font"];
        monospace = ["JetBrainsMono Nerd Font Mono"];
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
  programs.system-config-printer.enable = true;
  security.pam.services.hyprlock = {};

  services = {
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    colord.enable = true;
    dbus = {
      enable = true;
      implementation = "broker";
      packages = [pkgs.gcr];
    };
    flatpak.enable = false;
    geoclue2.enable = true;
    gvfs.enable = false;
    printing = {
      enable = true;
      drivers = [pkgs.cnijfilter2];
    };
    system-config-printer.enable = true;
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

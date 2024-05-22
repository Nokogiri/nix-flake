{ pkgs, ... }:
{

  security.pam.services.swaylock.fprintAuth = true;

  fonts.packages = with pkgs; [
    dejavu_fonts
    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk-sans
    weather-icons
  ];

  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    fontconfig = {
      enable = true;
      antialias = true;
    };
  };

  gtk.iconCache.enable = true;

  programs = {
    dconf.enable = true;
    gamemode = {
      enable = true;
      enableRenice = true;
    };
    sway = {
      enable = true;
      package = pkgs.swayfx;
    };
  };

  environment.systemPackages = with pkgs; [ wezterm ];
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
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  xdg.portal.xdgOpenUsePortal = false;
  xdg.portal.config = {
    common = {
      default = [ "gtk" ];
      "org.freedesktop.impl.portal.Settings" = [ "gtk" ];
    };
  };
}

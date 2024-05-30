{ pkgs, ... }:
{

  security.pam.services.swaylock.fprintAuth = true;

  gtk.iconCache.enable = true;

  programs = {
    dconf.enable = true;
    gamemode = {
      enable = true;
      enableRenice = true;
    };
  };

  environment.systemPackages = with pkgs; [
    wezterm
    xfce.thunar
  ];
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
    extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-xapp ];
    xdgOpenUsePortal = true;
    config.common = {
      default = [
        "gtk"
      ];
      "org.freedesktop.impl.portal.Settings" = [ "gtk" ];
    };
  };
}

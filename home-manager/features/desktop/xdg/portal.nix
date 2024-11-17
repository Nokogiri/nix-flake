{ pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    extraPortals = [
      #pkgs.kdePackages.xdg-desktop-portal-kde
      pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal-gtk
    ];
    xdgOpenUsePortal = false;
    #configPackages = [ pkgs.kdePackages.plasma-workspace ];
    config = {
      common = {
        default = [
          "gtk"
          "wlr"
        ];
      };
    };
  };
}

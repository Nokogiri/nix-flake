{ pkgs, ...}:{
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
    xdgOpenUsePortal = true;
    config = {
      common = {
        default = [
          "kde"
        ];
      };
    };
  };
}

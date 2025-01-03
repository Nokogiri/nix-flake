{
  xdg.portal = {
    enable = true;
    extraPortals = [
      #pkgs.xdg-desktop-portal-wlr
      #pkgs.xdg-desktop-portal-hyprland
      #inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland
      #pkgs.xdg-desktop-portal-gtk
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

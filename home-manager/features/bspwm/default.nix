{
  imports = [
    ./config.nix
    ./picom.nix
  ];
  home.sessionVariables = {
    MOZ_USE_XINPUT2 = "1";
  };
  xsession.windowManager.bspwm = {
    enable = true;
  };
  services.sxhkd.enable = true;
}

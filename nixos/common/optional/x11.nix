{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    windowManager.bspwm.enable = true;
    windowManager.awesome = {
      enable = true;
      luaModules = with pkgs.luaPackages; [
        luarocks # is the package manager for Lua modules
        luadbi-mysql # Database abstraction layer
      ];
    };
  };
  programs.sway.enable = false;
  services.displayManager = {
    defaultSession = "none+awesome";
  };
  environment.pathsToLink = [ "/libexec" ];

  environment.sessionVariables = {
    BROWSER = "${pkgs.firefox}/bin/firefox";
    DISABLE_QT5_COMPAT = "0";
    NO_AT_BRIDGE = "1";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    MOZ_USE_XINPUT2 = "1";
  };
}

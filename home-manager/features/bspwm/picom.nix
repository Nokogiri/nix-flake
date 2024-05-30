{ pkgs, ... }:
{
  services.picom = {
    enable = true;
    package = pkgs.picom-next;
    backend = "egl";
    vSync = true;
    settings = {
      blur = {
        method = "gaussian";
        size = 10;
        deviation = 5.0;
      };
    };
  };
}

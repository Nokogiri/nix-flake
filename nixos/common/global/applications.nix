{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bat
    dust
    fd
    gdu
    libarchive
    lm_sensors
    ripgrep
  ];
}

{
  pkgs,
  lib,
  ...
}: {
  networking.networkmanager = {
    wifi.backend = "iwd";
    wifi.powersave = true;
    enable = true;
    logLevel = "ERR";
    plugins = lib.mkForce [];
  };
  #environment.systemPackages = [pkgs.networkmanagerapplet];
}

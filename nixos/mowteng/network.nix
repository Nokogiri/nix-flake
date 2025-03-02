{lib, ...}: {
  networking.networkmanager = {
    wifi.backend = "iwd";
    wifi.powersave = true;
    enable = true;
    dns = "systemd-resolved";
    logLevel = "ERR";
    plugins = lib.mkForce [];
  };
  networking.useDHCP = false;

  services.resolved = {
    enable = true;
    llmnr = "true";
    #domains = [ "home.arpa" ];
    fallbackDns = ["9.9.9.9"];
  };
}

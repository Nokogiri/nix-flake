{ pkgs, config, ... }:{
  services.nextcloud = {
    enable = true;
    hostName = "next.fishoeder.net";
    package = pkgs.nextcloud29;
    configureRedis = true;
    maxUploadSize = "10G";
  };
}

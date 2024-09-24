{ pkgs, config, ... }:{
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud29;
    configureRedis = true;
    maxUploadSize = "10G";
  };
}

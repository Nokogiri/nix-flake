{ pkgs, config, ... }:{
  sops.secrets.nextadmin = {
    sopsFile = ../../common/secrets.yaml;
    owner = config.users.users.nobody.name; # config.services.mealie.user;
    group = config.users.users.nobody.group;
    mode = "0666";
  };
  services.nextcloud = {
    enable = true;
    hostName = "next.fishoeder.net";
    package = pkgs.nextcloud29;
    configureRedis = true;
    maxUploadSize = "10G";
    config.adminpassFile = config.sops.secrets.nextadmin.path;
  };
}

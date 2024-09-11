{ config, ... }:{
  sops.secrets.davuser = {
    sopsFile = ../../../../common/secrets.yaml;
    owner = config.services.nginx.user;
    group = config.services.nginx.group;
  };
  services.nginx = {
    virtualHosts."files.fishoeder.net" = {
      useACMEHost = "fishoeder.net";
      forceSSL = true;
      root = "/srv/www/files";
      locations = {
        "~ ^/org(/.*)?$" = {
          basicAuthFile = config.sops.secrets.davuser.path;
          extraConfig = ''
            dav_methods put delete mkcol copy move;
            dav_access  user:rw;
            create_full_put_path on;
          '';
          alias = "/media/Vault3.1/personal/Org\$1";
        };
      };
    };
  };
}

{ config, ... }:{
  sops.secrets.gamevault = {
    sopsFile = ../../../common/secrets.yaml;
    owner = config.users.users.nokogiri.name;
    group = config.users.users.nobody.group;
    mode = "0666";
  };
  virtualisation.oci-containers.containers = {
    gamevault = {
      image = "phalcode/gamevault-backend:latest";
      autoStart = true;
      restart = "unless-stopped";
      environmentFiles = [
        config.sops.secrets.gamevault.path
      ];
      environment = {
        DB_HOST = "db";
      };
      volumes = [
        "/media/Vault3.1/GameVault/Images:/images"
        "/media/Vault3.1/GameVault/Games:/files"
      ];
      ports = [ "8989:8080/tcp" ];
    };
    db = {
      image = "postgres:16";
      autoStart = true;
      restart = "unless-stopped";
      environmentFiles = [
        config.sops.secrets.gamevault.path
      ];
      environment = {
        POSTGRES_DB = "gamevault";
      };
      volumes = [
        "gamevault_db:/var/lib/postgresql/data"
      ];
    };
  };
}

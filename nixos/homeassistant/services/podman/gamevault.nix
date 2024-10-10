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
      #restart = "unless-stopped";
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
      ports = [ "192.168.178.57:8999:8080/tcp" ];
    };
    db = {
      image = "postgres:16";
      hostname = "db";
      autoStart = true;
      #restart = "unless-stopped";
      environmentFiles = [
        config.sops.secrets.gamevault.path
      ];
      environment = {
        POSTGRES_DB = "gamevault";
      };
      volumes = [
        "/var/lib/pods/gamevault_db:/var/lib/postgresql/data"
      ];
    };
  };
}

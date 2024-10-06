{ config, ... }:
{
  sops.secrets.mealie_mail = {
    sopsFile = ../../../common/secrets.yaml;
    owner = config.users.users.nokogiri.name;
    group = config.users.users.nobody.group;
    mode = "0666";

  };
  virtualisation.oci-containers.containers = {
    nextcloud-aio-mastercontainer = {
      image = "nextcloud/all-in-one:latest";
      autoStart = true;
      volumes = [
        "/var/lib/pods/nextcloud:/mnt/docker-aio-config"
        "/var/run/docker.sock:/var/run/docker.sock:ro"
      ];
      environment = {
        TZ = "Europe/Berlin";
        NEXTCLOUD_MOUNT = "/media/";
        NEXTCLOUD_UPLOAD_LIMIT = "10G";
        NEXTCLOUD_ENABLE_DRI_DEVICE = "true";
      };
      ports = [
        "9898:8080"
        "12443:8443"
      ];
    };
  };
}

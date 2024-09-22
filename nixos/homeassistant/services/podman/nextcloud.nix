{ config, ... }:
{
  sops.secrets.mealie_mail = {
    sopsFile = ../../../common/secrets.yaml;
    owner = config.users.users.nokogiri.name;
    group = config.users.users.nobody.group;
    mode = "0666";

  };
  virtualisation.oci-containers.containers = {
    nextcloudAIO = {
      image = "nextcloud/all-in-one:latest";
      autoStart = true;
      volumes = [ "nextcloud_aio_mastercontainer:/var/lib/pods/netcloud" ];
      environment = {
        TZ = "Europe/Berlin";
        NEXTCLOUD_MOUNT =  "/media/";
        NEXTCLOUD_UPLOAD_LIMIT = "10G";
        NEXTCLOUD_ENABLE_DRI_DEVICE = "true";
      };
      ports = [ "9898:8080" "12443:8443" ];
    };
  };
}

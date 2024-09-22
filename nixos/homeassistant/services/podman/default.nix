{
  imports = [
    ../../../common/optional/podman.nix
    ./esphome.nix
    ./homeassistant.nix
    ./mealie.nix
    #./nextcloud.nix
    ./pihole.nix
    #./uptime-kuma.nix
  ];
  virtualisation.podman.networkSocket = {
    enable = false;
    server = "ghostunnel";
    #tls.key = "/var/lib/podman/serverkey.pem";
    #tls.cert = "/var/lib/podman/server.pem";
    #tls.cacert = "/var/lib/podman/client/pem";
  };
}

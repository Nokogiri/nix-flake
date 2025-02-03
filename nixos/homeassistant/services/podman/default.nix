{
  imports = [
    ../../../common/optional/podman.nix
    ./calibre-web.nix
    ./esphome.nix
    #./homeassistant.nix
    ./mealie.nix
    ./pihole.nix
  ];
  virtualisation.podman.networkSocket = {
    enable = false;
    server = "ghostunnel";
  };
}

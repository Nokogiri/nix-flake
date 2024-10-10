{
  imports = [
    ../../../common/optional/podman.nix
    ./esphome.nix
    ./gamevault.nix
    ./homeassistant.nix
    ./mealie.nix
    ./pihole.nix
  ];
  virtualisation.podman.networkSocket = {
    enable = false;
    server = "ghostunnel";
  };
}

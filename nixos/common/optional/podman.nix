{ lib, ... }:
{
  virtualisation.oci-containers.backend = "docker";
  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
  };
  virtualisation.podman = {
    enable = false;
    autoPrune.enable = true;
    dockerSocket.enable = true;
  };
  virtualisation.containers.storage.settings = {
    storage = {
      driver = lib.mkForce "btrfs";
      graphroot = "/var/lib/containers/storage";
      runroot = "/run/containers/storage";
    };
  };
}

{
  imports = [
    #./fail2ban.nix
    ./flood.nix
    #./forgejo.nix
    ./homeassistant.nix
    ./immich.nix
    ./mealie.nix
    ./minio.nix
    ./nextcloud.nix
    ./nginx
    ./samba.nix
    ./podman
    ./postgresql.nix
    ./jellyfin.nix
    ./vaultwarden.nix
  ];
}

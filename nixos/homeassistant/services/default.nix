{
  imports = [
    #./fail2ban.nix
    ./flood.nix
    ./forgejo.nix
    ./homeassistant.nix
    ./mealie.nix
    ./nextcloud.nix
    ./nginx
    ./samba.nix
    ./podman
    ./postgresql.nix
    ./jellyfin.nix
    ./vaultwarden.nix
  ];
}

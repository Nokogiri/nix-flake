{
  imports = [
    #./fail2ban.nix
    ./flood.nix
    ./homeassistant.nix
    ./nextcloud.nix
    ./nginx
    ./samba.nix
    ./podman
    ./postgresql.nix
    ./jellyfin.nix
    ./vaultwarden.nix
  ];
}

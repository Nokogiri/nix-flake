{pkgs, ...}: {
  services.postgresql = {
    enable = true;
    settings = {
      password_encryption = "scram-sha-256";
    };
    ensureDatabases = [
      "nextcloud"
      "hass"
      "forgejo"
    ];
    ensureUsers = [
      {
        name = "nextcloud";
      }
      {
        name = "hass";
        ensureDBOwnership = true;
      }
      {
        name = "forgejo";
        ensureDBOwnership = true;
      }
    ];
    authentication = pkgs.lib.mkOverride 10 ''
      #type database  DBuser  auth-method
      local all       all     trust
      host  all all 127.0.0.1/32 trust
      host  all all ::1/128      trust
    '';
  };
}

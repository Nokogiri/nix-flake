{pkgs, ...}: {
  services.postgresql = {
    enable = true;
    settings = {
      password_encryption = "scram-sha-256";
    };
    ensureDatabases = [
      "nextcloud"
      "hass"
    ];
    ensureUsers = [
      {
        name = "nextcloud";
      }
      {
        name = "hass";
        ensureDBOwnership = true;
      }
    ];
    authentication = pkgs.lib.mkOverride 10 ''
      #type database  DBuser  auth-method
      local all       all     trust
    '';
  };
}

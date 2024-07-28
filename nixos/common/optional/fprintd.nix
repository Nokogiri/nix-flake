{ inputs, ... }:
{
  services.fprintd = {
    enable = true;
    package = inputs.stable.legacyPackages.x86_64-linux.fprintd;
  };
  systemd.services.fprintd = {
    wantedBy = [ "multi-user.target" ];
    serviceConfig.Type = "simple";
  };
}

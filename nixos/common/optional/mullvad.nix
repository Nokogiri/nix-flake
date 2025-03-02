{
  inputs,
  pkgs,
  ...
}: {
  services.mullvad-vpn = {
    enable = true;
    package = inputs.stable.legacyPackages.${pkgs.system}.mullvad;
  };
}

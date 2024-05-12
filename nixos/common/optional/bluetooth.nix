{ pkgs, ... }:
{
  hardware = {
    bluetooth.enable = true;
    bluetooth.package = pkgs.bluez5-experimental;
    bluetooth.settings = {
      General = {
        ControllerMode = "dual";
        Experimental = true;
      };
      Policy = {
        AutoEnable = true;
      };
    };
  };
  systemd.services.bluetooth.serviceConfig.ExecStart = [
    ""
    "${pkgs.bluez}/libexec/bluetooth/bluetoothd --experimental"
  ];
}

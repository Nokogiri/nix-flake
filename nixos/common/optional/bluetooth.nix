{ pkgs, ... }:
{
  hardware = {
    bluetooth.enable = true;
    bluetooth.package = pkgs.bluez5-experimental;
    bluetooth.settings = {
      General = {
        ControllerMode = "dual";
        Experimental = true;
        Disable = "Handsfree,Headset";
      };
      Policy = {
        AutoEnable = true;
      };
    };
    bluetooth.powerOnBoot = true;
  };
  services.pipewire.wireplumber.extraConfig = {
    wireplumber.settings = {
      "bluetooth.autoswitch-to-headset-profile" = false;
    };
    bluez_monitor.properties = {
      #"bluez5.enable-sbc-xq" = true;
      #"bluez5.enable-msbc" = false;
      #"bluez5.enable-cvsd" = false;
      #"bluez5.enable-hw-volume" = true;
      "bluez5.roles" = [
        "a2dp_sink"
        "a2dp_source"
      ];
    };
  };

  systemd.services.bluetooth.serviceConfig.ExecStart = [
    ""
    "${pkgs.bluez}/libexec/bluetooth/bluetoothd --experimental"
  ];
}

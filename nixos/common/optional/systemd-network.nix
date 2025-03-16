{
  systemd.network = {
    enable = true;
    wait-online = {
      enable = false;
      timeout = 20;
      anyInterface = false;
      ignoredInterfaces = [
        "haos"
        "veth0"
        "veth1"
        "wlan0"
        "podman0"
        "veth0@if2"
        "mullvad0"
      ];
    };
  };
}

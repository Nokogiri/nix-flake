{
  networking.firewall.enable = false;
  networking.firewall = {
    trustedInterfaces = [
      "calvin"
      "haos"
      "wg0"
      "enp1s0f0"
      "br0"
      "mullvad0"
    ];
    allowedTCPPorts = [
      80
      443
      1900
      5353
      6052
      6771
      6881
      8123
      8989
      9443
      9091
      8765
      10577
      59154
    ];
    allowedUDPPorts = [
      1900
      6771
      6881
      10577
      59154
    ];
    allowedUDPPortRanges = [
      {
        # kdeconnect
        from = 1714;
        to = 1764;
      }
    ];

    allowedTCPPortRanges = [
      {
        # kdeconnect
        from = 1714;
        to = 1764;
      }
    ];
  };
}

{pkgs, ...}: {
  services.flood = {
    enable = true;
    openFirewall = true;
    host = "192.168.178.57";
  };
  environment.systemPackages = with pkgs; [qbittorrent-nox];
  systemd.services."qbittorrent" = {
    enable = true;
    description = "qBittorrent NOX";
    after = [
      "network-online.target"
      "media-Vault3.1.mount"
    ];
    bindsTo = ["media-Vault3.1.mount"];
    wants = ["network-online.target"];
    wantedBy = ["default.target"];
    serviceConfig = {
      Type = "exec";
      User = "nokogiri";
      ExecStart = "${pkgs.qbittorrent-nox}/bin/qbittorrent-nox";
    };
  };
  #services.rtorrent = {
  #	enable = true;
  #	openFirewall = true;
  #	package = pkgs.jesec-rtorrent;
  #	group = "flood";
  #	user = "nokogiri";
  #};
}

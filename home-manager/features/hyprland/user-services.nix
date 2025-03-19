{pkgs, ...}: let
  image = "${../../../images/tori.png}";
in {
  systemd.user.services = {
    swaybg = {
      Unit = {
        Description = "swaybg?";
      };
      Service = {
        Type = "simple";
        ExecStart = "${pkgs.swaybg}/bin/swaybg -i ${image} -m fill";
        Restart = "on-failure";
      };
      Install = {
        WantedBy = ["hyprland-session.target"];
      };
    };
  };
}

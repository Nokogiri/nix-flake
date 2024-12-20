{
  pkgs,
  ...
}: let
  image = "${
    (pkgs.fetchurl {
      url = "https://next.fishoeder.net/s/wRsKNG93giFKExo/download/pexels-veeterzy-39811.jpg";
      hash = "sha256-kLDv0v4N9pQ4F6cXpFLTrJv90ehU0LI7sGJup+49kPM=";
    })
  }";
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

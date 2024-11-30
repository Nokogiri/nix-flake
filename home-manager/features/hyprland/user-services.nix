{
  pkgs,
  inputs,
  ...
}: let
  image = "${
    (pkgs.fetchurl {
      #url = "https://next.fishoeder.net/s/XobW8J2DiN7pAXo/download/dIbcnTB.png";
      url = "https://next.fishoeder.net/s/wRsKNG93giFKExo/download/pexels-veeterzy-39811.jpg";
      #hash = "sha256-PYWWdCzHCJIUxNC7TDTN0t6NSRVB0DiUyfe5Ve/z5Dc=";
      hash = "sha256-kLDv0v4N9pQ4F6cXpFLTrJv90ehU0LI7sGJup+49kPM=";
    })
  }";
in {
  systemd.user.services = {
    iio-hyprland = {
      Unit = {
        Description = "Rotate My Hyprland!";
      };
      Service = {
        Type = "simple";
        ExecStart = "${inputs.iio-hyprland.packages.${pkgs.system}.default}/bin/iio-hyprland";
        Restart = "on-failure";
      };
      Install = {
        WantedBy = ["hyprland-session.target"];
      };
    };
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
    polkit-kde-authentication-agent-1 = {
      Unit = {
        Description = "Auth Agent";
      };
      Service = {
        Type = "simple";
        ExecStart = "${pkgs.kdePackages.polkit-kde-agent-1}/libexec/polkit-kde-authentication-agent-1";
        Restart = "on-failure";
      };
      Install = {
        WantedBy = ["hyprland-session.target"];
      };
    };
    wvkbd = {
      Install = {
        WantedBy = ["hyprland-session.target"];
      };
    };
  };
}

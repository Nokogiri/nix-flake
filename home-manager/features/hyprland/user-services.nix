{ pkgs, inputs, ... }:
let
  image = "${
    (pkgs.fetchurl {
      #url = "https://files.fishoeder.net/walls/dusk/DUSKAsAbove.png";
      url = "https://next.fishoeder.net/s/BJyXtyinBnDoJwT/download/DUSK%20So%20Below%201440p.png";
      hash = "sha256-yIHe+i7+rUYwJipXV9hAXsyFdPsO8FAIQ0cnAQbbRGA=";
    })
  }";
in
{
  systemd.user.services = {
    iio-hyprland = {
      Unit = {
        Description = "Rotate My Hyprland!";
      };
      Service = {
        Type = "simple";
        ExecStart = "${
          inputs.iio-hyprland.packages.${pkgs.system}.default
        }/bin/iio-hyprland";
        Restart = "on-failure";
      };
      Install = {
        WantedBy = [ "hyprland-session.target" ];
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
        WantedBy = [ "hyprland-session.target" ];
      };
    };
    polkit-kde-authentication-agent-1 = {
      Unit = {
        Description = "Auth Agent";
      };
      Service = {
        Type = "simple";
        ExecStart = "${pkgs.libsForQt5.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1";
        Restart = "on-failure";
      };
      Install = {
        WantedBy = [ "hyprland-session.target" ];
      };
    };
    wvkbd = {
      Install = {
        WantedBy = [ "hyprland-session.target" ];
      };
    };
  };
}

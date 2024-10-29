{ pkgs, inputs, ... }:
let
  image = "${
    (pkgs.fetchurl {
      url = "https://next.fishoeder.net/s/EB6D8Czb7E23QpQ/download/DUSK%20As%20Above%201440p.png";
      hash = "sha256-IQKk6kwqfzgMkT6bt4/kXen3ft/Is7QyuOBDxlMPYhk=";
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

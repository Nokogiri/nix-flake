{ pkgs, inputs, ... }:
let
  image = "${
    (pkgs.fetchurl {
      #url = "https://next.fishoeder.net/s/EB6D8Czb7E23QpQ/download/DUSK%20As%20Above%201440p.png";
      url = "https://next.fishoeder.net/s/XobW8J2DiN7pAXo/download/dIbcnTB.png";
      #url = "https://next.fishoeder.net/s/ALSGNsmK2F5g9bH/download/vapor_1.jpg";
      #url = "https://next.fishoeder.net/s/MC42jXjsYcH3mkR/download/vapor_1-darker.jpg";
      #hash = "sha256-IQKk6kwqfzgMkT6bt4/kXen3ft/Is7QyuOBDxlMPYhk=";
      hash = "sha256-PYWWdCzHCJIUxNC7TDTN0t6NSRVB0DiUyfe5Ve/z5Dc=";
      #hash = "sha256-Q79Z3j57KthdEWmfQDxyjt182uKfKuBvwOANsMJ+liQ=";
      #hash = "sha256-nhiuAmx4ZbhEAJZKq26J0j7Pz5Q2H8rGpstd4UFK/S4=";
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
        ExecStart = "${pkgs.kdePackages.polkit-kde-agent-1}/libexec/polkit-kde-authentication-agent-1";
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

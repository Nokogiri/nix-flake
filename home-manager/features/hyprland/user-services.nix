{ pkgs, inputs, ... }:
{
  systemd.user.services = {
    iio-hyprland = {
      Unit = {
        Description = "Rotate My Hyprland!";
      };
      Service = {
        Type = "simple";
        #ExecStart = "${pkgs.iio-hyprland}/bin/iio-hyprland";
        ExecStart = "${
          inputs.iio-hyprland.packages.${pkgs.system}.default
        }/bin/iio-hyprland";
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
    #swaynotificationcenter = {
    #  Install = {
    #    WantedBy = [ "hyprland-session.target" ];
    #  };
    #};
    #hyprpaper = {
    #  Install = {
    #    WantedBy = [ "hyprland-session.target" ];
    #  };
    #};
  };
}

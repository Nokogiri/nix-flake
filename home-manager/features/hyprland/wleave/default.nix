{ pkgs, ... }:{
  programs.wlogout = {
    enable = true;
    package = pkgs.wleave;
    layout = [
      {
        label = "logout";
        action = "uwsm stop";
        text = "Logout";
        keybind = "e";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "e";
      }
    ];
    style = ''
    @import url("${./mauve.css}");

    #logout {
      background-image: url("${../../../../images/wleave/logout.png}");
    }
    #reboot {
      background-image: url("${../../../../images/wleave/reboot.png}");
    }
    '';
  };
}

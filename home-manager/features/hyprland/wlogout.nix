{
  programs.wlogout = {
    enable = true;
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
  };
}

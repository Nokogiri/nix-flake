{
  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      hyprland = {
        prettyName = "Hyprland";
        comment = "Hyprland compositor managed by UWSM";
        binPath = "/run/current-system/sw/bin/Hyprland";
      };
      steam-gamescope = {
        prettyName = "Steam";
        comment = "Steam Gamescope Session managed by UWSM";
        binPath = "/run/current-system/sw/bin/steam-gamescope";
      };
    };
  };
}

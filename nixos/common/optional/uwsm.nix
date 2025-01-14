{
  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      steam-gamescope = {
        prettyName = "Steam";
        comment = "Steam Gamescope Session managed by UWSM";
        binPath = "/run/current-system/sw/bin/steam-gamescope";
      };
    };
  };
}

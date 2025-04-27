let
  img0 = "${../../../images/spiderman.webp}";
in {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;

      preload = [
        img0
      ];

      wallpaper = [
        "eDP-1,${img0}"
      ];
    };
  };
}

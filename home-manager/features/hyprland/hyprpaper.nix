let
  img0 = "${../../../images/tori.jxl}";
in {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;

      preload = [
        img0
        #img1
        #img2
        #img3
      ];

      wallpaper = [
        "eDP-1,${img0}"
      ];
    };
  };
}

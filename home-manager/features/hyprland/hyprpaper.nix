  let 
    img0 = "${../../../images/pink.jxl}";
    img1 = "${../../../images/tori.jxl}";
    img2 = "${../../../images/adventure.jxl}";
    img3 = "${../../../images/sunset.jxl}";
    img4 = "${../../../images/scandinavia.jxl}";
  in
{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;

      preload = [
        img0 img1 img2 img3 img4
      ];

      wallpaper = [
        "eDP-1,${img0}"
      ];
    };
  };
}

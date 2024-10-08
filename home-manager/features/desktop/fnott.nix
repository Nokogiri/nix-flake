{
  services.fnott = {
    enable = true;
    settings = {
      main = {
        notification-margin = 5;
        border-radius = 6;
      };

      low = {
        #timeout = 5;
        title-font = "Overpass:weight=bold:slant=italic";
        title-color = "ffffffff";
      };
    };
  };
}

{ config, ... }:{
  xdg.userDirs = {
    enable = true;
    desktop = "${config.home.homeDirectory}/files/top";
    documents = "${config.home.homeDirectory}/files/doc";
    download = "${config.home.homeDirectory}/files/dlc";
    music = "${config.home.homeDirectory}/files/mus";
    pictures = "${config.home.homeDirectory}/files/pic";
    publicShare = "${config.home.homeDirectory}/files/pub";
    templates = "${config.home.homeDirectory}/files/tpl";
    videos = "${config.home.homeDirectory}/files/vid";
    extraConfig = {
      XDG_MISC_DIR = "${config.home.homeDirectory}/files/tmp";
    };
  };
}

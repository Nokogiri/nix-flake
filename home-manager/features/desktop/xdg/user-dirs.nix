{config, ...}: {
  xdg.userDirs = {
    enable = true;
    desktop = "${config.home.homeDirectory}/Desktop";
    documents = "${config.home.homeDirectory}/Nextcloud/Files";
    download = "${config.home.homeDirectory}/Downloads";
    music = "${config.home.homeDirectory}/Nextcloud/Music";
    pictures = "${config.home.homeDirectory}/Nextcloud/Pictures";
    publicShare = "${config.home.homeDirectory}/Public";
    templates = "${config.home.homeDirectory}/Templates";
    videos = "${config.home.homeDirectory}/Nextcloud/Videos";
    extraConfig = {
      XDG_MISC_DIR = "${config.home.homeDirectory}/Temp";
    };
  };
}

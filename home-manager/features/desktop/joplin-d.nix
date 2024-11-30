{
  programs.joplin-desktop = {
    enable = true;
    sync = {
      interval = "10m";
      target = "webdav";
    };
  };
}

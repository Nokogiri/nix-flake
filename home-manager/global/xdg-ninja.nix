{config, ...}: {
  programs.bash.historyFile = "${config.xdg.stateHome}/bash/history";
  home.sessionVariables = {
    CALCHISTFILE = "${config.xdg.cacheHome}/calc_history";
    DOTNET_CLI_HOME = "${config.xdg.dataHome}/dotnet";
    DVDCSS_CACHE = "${config.xdg.dataHome}/dvdcss";
    PYTHON_HISTORY = "${config.xdg.dataHome}/python/history";
    XCOMPOSECACHE = "${config.xdg.cacheHome}/X11/xcompose";
  };
}

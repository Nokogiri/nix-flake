{ pkgs, config, ... }:
{
  #home.packages = with pkgs; [
  #  everforest-theme
  #  libsForQt5.qt5ct
  #  qt6Packages.qt6ct
  #  libsForQt5.qtstyleplugin-kvantum
  #  qt6Packages.qtstyleplugin-kvantum
  #];

  
  #gtk = {
  #  enable = true;
  #  iconTheme = {
  #    name = "Everforest-Dark";
  #    package = pkgs.everforest-theme;
  #  };
  #  cursorTheme = {
  #    name = "phinger-cursors-light";
  #    package = pkgs.phinger-cursors;
  #  };
    #theme = {
    #  name = "Gruvbox-Material-Dark";
    #  package = pkgs.gruvbox-material;
    #};
  #};

  stylix.targets = {
   nixvim.enable = false;
    vim.enable = false;
    waybar.enable = false;
  };
}

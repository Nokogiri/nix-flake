{ pkgs, config, ... }:
{
  home.file.".icons/default/index.theme".text = ''
    [Icon Theme]
    Name=Default
    Comment=Default Cursor Theme
    Inherits=${config.gtk.cursorTheme.name}
  '';

  qt.style.name = "Kvantum-Dark";

  gtk = {
    enable = true;
    iconTheme = {
      name = "Everforest-Dark";
      package = pkgs.everforest-theme;
    };
    cursorTheme = {
      name = "phinger-cursors-light";
      package = pkgs.phinger-cursors;
    };
  };

  stylix.targets = {
    gtk.enable = true;
    kde.enable = true;
    kitty.enable = false;
    mako.enable = false;
    mangohud.enable = false;

    nixvim.enable = false;
    rofi.enable = false;
    vim.enable = false;
    waybar.enable = false;
    wezterm.enable = false;
  };
}

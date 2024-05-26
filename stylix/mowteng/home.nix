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
    theme = {
      #name = "Everforest-Dark-BL";
      #package = pkgs.everforest-theme;
      #name = "adw-gtk3";
      #package = pkgs.adw-gtk3;
    };
    iconTheme = {
      name = "Gruvbox-Plus-Dark";
      package = pkgs.gruvbox-plus-icons;
    };
    cursorTheme = {
      name = "phinger-cursors-light";
      package = pkgs.phinger-cursors;
    };
    gtk3 = {
      extraConfig = {
        gtk-recent-files-limit = 10;
      };
    };
  };

  stylix.targets = {
    gtk = {
      enable = true;
      
    };
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

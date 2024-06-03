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
      extraCss = ''
        .window-frame, .window-frame:backdrop {
          box-shadow: 0 0 0 black;
          border-style: none;
          margin: 0;
          border-radius: 0;
        }
            
        .titlebar {
          border-radius: 0;
        }
      '';
    };

    kitty = {
      enable = false;
      variant256Colors = true;
    };
    mangohud.enable = false;
    fish.enable = true;
    nixvim.enable = false;
    rofi.enable = false;
    vim.enable = false;
    waybar.enable = false;
    wezterm.enable = false;
  };
}

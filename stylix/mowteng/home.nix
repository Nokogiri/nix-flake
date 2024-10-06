{ pkgs, config, ... }:
{
  imports = [ ../home_defaults.nix ];
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

        .window-frame.csd.popup {
          box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2), 0 0 0 1px rgba(0, 0, 0, 0.13);
        }

        .header-bar {
          background-image: none;
          background-color: #ededed;
          box-shadow: none;
        }
        /* You may want to use this if you do not like the double title.
        GtkLabel.title {
            opacity: 0;
        }*/
      '';
    };

    #hyprland.enable = true;
    #hyprpaper.enable = true;

    #kitty.enable = true;
    sway.enable = true;
    swaylock.enable = true;
    xresources.enable = true;
    zathura.enable = true;
  };
}

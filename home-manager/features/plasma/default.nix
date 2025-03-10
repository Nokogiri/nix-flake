{pkgs, ...}: {
  imports = [./dolphin.nix ./panel.nix];
  gtk = {
    enable = true;
    cursorTheme = {
      name = "breeze_cursors";
      package = pkgs.kdePackages.breeze;
    };
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };
    gtk3 = {
      extraConfig = {
        gtk-recent-files-limit = 10;
      };
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
    theme = {
      name = "catppuccin-frappe-mauve-standard";
      package = pkgs.catppuccin-gtk.override {
        variant = "frappe";
        accents = ["mauve"];
      };
    };
  };
}

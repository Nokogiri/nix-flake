{ config, pkgs, ... }:
{

  imports = [
    ./colors.nix
    ./firefox
    ./foot.nix
    ./gpg-agent.nix
    ./joplin-d.nix
    ./rbw.nix
    ./rofi
    ./swaync.nix
    ./swayosd.nix
    ./udisks.nix
    ./vscode.nix
    ./kitty.nix
    ./xdg
    ./ydotool.nix
    ./zathura.nix
  ];

  home.packages = with pkgs; [
    libnotify
    xdg-utils
  ];

  home.file.".icons/default/index.theme".text = ''
    [Icon Theme]
    Name=Default
    Comment=Default Cursor Theme
    Inherits=${config.gtk.cursorTheme.name}
  '';

  qt = {
    enable = true;
    style.name = "qt5ct-style";
    platformTheme.name = "qtct";
  };

  home.pointerCursor = {
    package = pkgs.dracula-theme;
    gtk.enable = true;
    name = "Dracula-cursors";
    size = 24;
    x11.enable = true;
  };
  home.preferXdgDirectories = true;
  gtk = {
    enable = true;
    iconTheme = {
      name = "Dracula";
      package = pkgs.dracula-icon-theme;
    };
    cursorTheme = {
      name = "Dracula-cursors";
      package = pkgs.dracula-theme;
    };
    font = {
      name = "IntoneMono Nerd Font Propo";
      size = 11;
    };
    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
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
  };

  home.sessionVariables = {
    BROWSER = "${pkgs.firefox}/bin/firefox";
    DISABLE_QT5_COMPAT = "0";
    NO_AT_BRIDGE = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
  };

  systemd.user.sessionVariables = {
    PATH = "/var/lib/flatpak/exports/bin:/run/wrappers/bin:/home/nokogiri/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin";
  };
}

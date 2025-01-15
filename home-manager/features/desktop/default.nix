{pkgs, ...}: {
  imports = [
    ./cli.nix
    ./colors.nix
    ./firefox
    ./gpg-agent.nix
    ./joplin-d.nix
    ./kitty.nix
    #./obs-studio.nix
    ./rbw.nix
    ./rofi
    ./swaync
    ./vscode.nix
    ./wezterm.nix
    ./xdg
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      emoji = ["Noto Emoji"];
    };
  };

  gtk = {
    enable = true;
    cursorTheme = {
      name = "breeze_cursors";
      package = pkgs.kdePackages.breeze;
    };
    font = {
      name = "IntoneMono Nerd Font";
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

  home.packages = with pkgs; [
    (catppuccin-gtk.override {
      variant = "frappe";
      accents = ["mauve"];
    })
    (catppuccin-papirus-folders.override {
      flavor = "frappe";
      accent = "mauve";
    })
    (catppuccin.override {
      variant = "frappe";
      accent = "mauve";
    })
    cliphist
    libnotify
    xdg-utils
    kdePackages.qt6ct
    kdePackages.qtstyleplugin-kvantum
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    (writeShellScriptBin "launch-gamescope" ''
      exec env LD_PRELOAD="" nice -n -11 -- gamescope "$@"
    '')
    wl-clipboard
  ];

  home.pointerCursor = {
    package = pkgs.kdePackages.breeze;
    gtk.enable = true;
    name = "breeze_cursors";
    size = 24;
    x11.enable = true;
  };

  home.preferXdgDirectories = true;

  home.sessionVariables = {
    BROWSER = "${pkgs.firefox}/bin/firefox";
    DISABLE_QT5_COMPAT = "0";
    NO_AT_BRIDGE = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    NIXOS_OZONE_WL = "1";
    KWIN_DRM_DISABLE_TRIPLE_BUFFERING = "1";
  };

  systemd.user.sessionVariables = {
    PATH = "/var/lib/flatpak/exports/bin:/run/wrappers/bin:/home/nokogiri/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin";
  };
}

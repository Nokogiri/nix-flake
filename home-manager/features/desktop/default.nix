{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./cli.nix
    ./colors.nix
    ./floorp
    ./gpg-agent.nix
    ./kitty.nix
    ./rbw.nix
    ./rofi
    ./swaync
    ./swayosd.nix
    ./xdg
    ./zathura.nix
    ./zed-editor.nix
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
      name = "JetBrainsMono Nerd Font";
      size = 10;
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
      name = "catppuccin-macchiato-mauve-standard";
      package = pkgs.catppuccin-gtk.override {
        variant = "macchiato";
        accents = ["mauve"];
      };
    };
  };

  home.packages = with pkgs;
  with kdePackages; [
    (catppuccin.override {
      variant = "macchiato";
      accent = "mauve";
    })
    inputs.iwmenu.packages.${pkgs.system}.default
    cliphist
    handlr-regex
    libnotify
    xdg-utils
    ark
    extest
    gwenview
    obsidian
    open-in-mpv
    pandoc
    texliveBasic
    qt6ct
    qtstyleplugin-kvantum
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    (writeShellScriptBin "launch-gamescope" ''
      exec env LD_PRELOAD="" nice -n -11 -- gamescope "$@"
    '')
    mullvad-vpn
    nextcloud-client
    wl-clipboard
    xfce.thunar
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
  };
  qt.style = {
    name = "kvantum";
  };
  qt.platformTheme.name = "kvantum";
  systemd.user.sessionVariables = {
    PATH = "/var/lib/flatpak/exports/bin:/run/wrappers/bin:/home/nokogiri/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin";
  };
}

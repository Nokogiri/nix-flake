{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./cli.nix
    ./colors.nix
    ./dunst.nix
    ./eww
    ./floorp
    ./gpg-agent.nix
    ./kitty.nix
    ./rbw.nix
    ./rofi
    ./swayosd.nix
    ./thunderbird.nix
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
      name = "JetBrainsMono Nerd Font Propo";
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
      name = "catppuccin-mocha-mauve-standard";
      package = pkgs.catppuccin-gtk.override {
        variant = "mocha";
        accents = ["mauve"];
      };
    };
  };

  home.packages = with pkgs;
  with kdePackages; [
    (catppuccin.override {
      variant = "mocha";
      accent = "mauve";
    })
    cliphist
    handlr-regex
    inputs.iwmenu.packages.${pkgs.system}.default
    (writeShellScriptBin "launch-gamescope" ''
      exec env LD_PRELOAD="" nice -n -11 -- gamescope "$@"
    '')
    libnotify
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    mullvad-vpn
    nextcloud-client
    obsidian
    open-in-mpv
    pandoc
    qt6ct
    qtstyleplugin-kvantum
    texliveBasic
    vesktop
    webcord
    wl-clipboard
    xdg-utils
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
    BROWSER = "${pkgs.floorp}/bin/floorp";
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

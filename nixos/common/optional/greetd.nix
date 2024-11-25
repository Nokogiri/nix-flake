{ pkgs, ... }:
{
  programs.regreet = {
    enable = true;
    settings = {
      background = {
        path = "${
          (pkgs.fetchurl {
            url = "https://next.fishoeder.net/s/XobW8J2DiN7pAXo/download/dIbcnTB.png";
            hash = "sha256-PYWWdCzHCJIUxNC7TDTN0t6NSRVB0DiUyfe5Ve/z5Dc=";
          })
        }";
      };
    };
    cursorTheme = {
      name = "Dracula-cursors";
      package = pkgs.dracula-theme;
    };
    font = {
      name = "Intel One Mono";
      size = 16;
      package = pkgs.intel-one-mono;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = (pkgs.papirus-icon-theme.override { color = "black"; });
    };
    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };
  };
  services.greetd = {
    enable = true;
  };
}

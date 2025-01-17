{pkgs, ...}: {
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "Hyprlaunch" ''
      exec systemd-cat --identifier=Hyprland Hyprland &> /dev/null
    '')
  ];
  programs.regreet = {
    enable = true;
    font = {
      name = "Intel One Mono";
      size = 12;
    };
    cursorTheme = {
      name = "breeze_cursors";
      package = pkgs.kdePackages.breeze;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "frappe";
        accent = "mauve";
      };
    };
    theme = {
      name = "catppuccin-macchiato-mauve-standard";
      package = pkgs.catppuccin-gtk.override {
        variant = "macchiato";
        accents = ["mauve"];
      };
    };
  };
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        #command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --asterisks --cmd Hyprlaunch ";
        command = "${pkgs.cage}/bin/cage -s -mlast -- ${pkgs.greetd.regreet}/bin/regreet";
        user = "greeter";
      };
    };
  };
}

{inputs, ...}: {
  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
  ];
  catppuccin = {
    flavor = "macchiato";
    enable = true;
    gtk.icon.enable = true;
    kitty.enable = true;
    kvantum = {
      flavor = "macchiato";
      accent = "mauve";
      enable = true;
      apply = true;
    };
    nvim.enable = false;
    tmux.extraConfig = ''
      set -g @catppuccin_window_status_style "rounded"
    '';
    rofi = {
      flavor = "macchiato";
      enable = false;
    };
    swaync.enable = false;
    waybar.mode = "createLink";
  };
}

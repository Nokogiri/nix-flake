{inputs, ...}: {
  imports = [
    inputs.catppuccin.homeModules.catppuccin
  ];
  catppuccin = {
    flavor = "mocha";
    accent = "teal";
    enable = true;
    dunst.enable = false;
    gtk.icon.enable = true;
    kitty.enable = true;
    kvantum = {
      flavor = "mocha";
      accent = "mauve";
      enable = true;
      apply = true;
    };
    nvim.enable = false;
    tmux.extraConfig = ''
      set -g @catppuccin_window_status_style "rounded"
    '';
    rofi = {
      flavor = "mocha";
      enable = false;
    };
    swaync.enable = false;
    waybar.mode = "createLink";
    zed.enable = true;
  };
}

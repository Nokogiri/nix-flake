{inputs, ...}: {
  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
  ];
  catppuccin = {
    flavor = "frappe";
    enable = true;
    gtk.icon.enable = true;
    kitty.enable = true;
    kvantum = {
      flavor = "frappe";
      accent = "mauve";
      enable = true;
      apply = true;
    };
    nvim.enable = false;
    tmux.extraConfig = ''
      set -g @catppuccin_window_status_style "rounded"
    '';
    rofi = {
      flavor = "frappe";
      enable = false;
    };
    swaync.enable = false;
    waybar.mode = "createLink";
    wlogout = {
      iconStyle = "wlogout";
      extraStyle = ''
        button {
          border-radius: 2px;
        }
      '';
      enable = true;
    };
  };
}

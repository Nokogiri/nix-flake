{
  inputs,
  lib,
  ...
}: {
  imports = [
    inputs.catppuccin.homeModules.catppuccin
  ];
  catppuccin = {
    flavor = "mocha";
    accent = "teal";
    enable = true;
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
    wlogout = {
      iconStyle = "wleave";
      extraStyle = ''
        button {
          border-radius: 2px;
        }
      '';
      enable = false;
    };
    zed.enable = false;
  };
}

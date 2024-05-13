{ pkgs, config, ... }:
{
  stylix.targets = {
   nixvim.enable = false;
    vim.enable = false;
    waybar.enable = false;
  };
}

# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  ...
}: {
  imports = [
    ../features/cli
    ./catppuccin.nix
    inputs.nix-index-database.hmModules.nix-index
  ];

  home = {
    username = lib.mkDefault "nokogiri";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = lib.mkDefault "22.05";
    enableNixpkgsReleaseCheck = false;
  };

  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      lfs.enable = true;
    };
    gpg.enable = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}

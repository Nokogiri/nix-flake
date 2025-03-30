{inputs, ...}: {
  imports = [
    inputs.catppuccin.nixosModules.catppuccin
  ];
  catppuccin = {
    cache.enable = true;
    enable = true;
    flavor = "macchiato";
    forgejo = {
      enable = true;
      flavor = "macchiato";
    };
    tty.flavor = "macchiato";
  };
}

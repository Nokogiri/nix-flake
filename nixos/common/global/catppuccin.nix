{inputs, ...}: {
  imports = [
    inputs.catppuccin.nixosModules.catppuccin
  ];
  catppuccin = {
    cache.enable = true;
    enable = true;
    flavor = "mocha";
    forgejo = {
      enable = true;
      flavor = "mocha";
    };
    tty.flavor = "mocha";
  };
}

{inputs, ...}: {
  imports = [
    inputs.catppuccin.nixosModules.catppuccin
  ];
  catppuccin = {
    cache.enable = false;
    enable = true;
    flavor = "mocha";
    tty.flavor = "mocha";
  };
}

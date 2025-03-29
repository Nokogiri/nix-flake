{inputs, ...}: {
  imports = [
    inputs.catppuccin.nixosModules.catppuccin
  ];
  catppuccin = {
    cache.enable = true;
    enable = true;
    flavor = "frappe";
    forgejo.flavor = "frappe";
    tty.flavor = "frappe";
  };
}

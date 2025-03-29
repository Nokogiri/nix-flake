{inputs, ...}: {
  imports = [
    inputs.catppuccin.nixosModules.catppuccin
  ];
  catppuccin = {
    cache.enable = true;
    enable = true;
    flavor = "frappe";
    forgejo = {
      enable = true;
      flavor = "frappe";
    };
    tty.flavor = "frappe";
  };
}

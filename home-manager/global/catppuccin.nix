{inputs, ...}: {
  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
  ];
  catppuccin = {
    flavor = "frappe";
    enable = true;
    gtk.icon.enable = true;
    waybar.mode = "createLink";
  };
}

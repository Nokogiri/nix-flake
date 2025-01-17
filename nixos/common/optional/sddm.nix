{pkgs, ...}: {
  environment.systemPackages = [
    (
      pkgs.catppuccin-sddm.override {
        flavor = "frappe";
        font = "IntoneMono Nerd Font";
        fontSize = "11";
        background = "${../../../images/above.png}";
        loginBackground = true;
      }
    )
  ];
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "catppuccin-frappe";
    package = pkgs.kdePackages.sddm;
  };
}

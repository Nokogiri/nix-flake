{ pkgs, ... }:{
  environment.systemPackages  = [
    (pkgs.where-is-my-sddm-theme.override {
      variants = [ "qt5"];
    })
  ];
  services.displayManager.sddm = {
    #package = pkgs.kdePackages.sddm;
    enable = true;
    wayland = {
      enable = true;
    };
    #theme = "where_is_my_sddm_theme_qt5";
  };
}

{pkgs, ...}: {
  home.packages = with pkgs; [
    rofi-rbw-wayland
    pinentry
  ];
  programs.rbw = {
    enable = true;
    settings = {
      email = "m.pappe@gefjon.org";
      base_url = "https://vault.fishoeder.net";
      pinentry = pkgs.pinentry-gnome3;
    };
  };
}

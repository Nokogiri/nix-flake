{pkgs, ...}: {
  home.packages = with pkgs; [rofimoji]; #rofi-rbw-wayland];
  programs.rofi = {
    package = pkgs.rofi-wayland;
    plugins = [pkgs.rofi-emoji-wayland];
    enable = true;
    extraConfig = {
      display-drun = "";
      modi = "drun,ssh,emoji";
      kb-primary-paste = "Control+V,Shift+Insert";
      kb-secondary-paste = "Control+v,Insert";
      show-icons = true;
    };
  };

  xdg.configFile."rofimoji.rc".text = ''
    files all
  '';
}

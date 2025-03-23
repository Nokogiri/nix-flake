{
  pkgs,
  inputs,
  ...
}: let
  img0 = "${../../../images/tori.jxl}";
  #img1 = "${../../../images/pink.jxl}";
  #img2 = "${../../../images/adventure.jxl}";
  #img3 = "${../../../images/scandinavia.jxl}";
in {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;

      preload = [
        img0
        #img1
        #img2
        #img3
      ];

      wallpaper = [
        "eDP-1,${img0}"
      ];
    };
  };
  #home.packages = [
  #  (pkgs.writeShellScriptBin "img0" ''
  #    ${inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland}/bin/hyprctl hyprpaper wallpaper eDP-1,${img0}
  #  '')
  #  (pkgs.writeShellScriptBin "img1" ''
  #    ${inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland}/bin/hyprctl hyprpaper wallpaper eDP-1,${img1}
  #  '')
  #  (pkgs.writeShellScriptBin "img2" ''
  #    ${inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland}/bin/hyprctl hyprpaper wallpaper eDP-1,${img2}
  #  '')
  #  (pkgs.writeShellScriptBin "img3" ''
  #    ${inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland}/bin/hyprctl hyprpaper wallpaper eDP-1,${img3}
  #  '')
  #];
}

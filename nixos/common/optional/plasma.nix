{ pkgs, ... }:{
  environment.systemPackages = with pkgs; [
    klassy
    krohnkite
    kwin-effects-geometry-change 
    panel-system-info
    plasma-window-title-applet
  ];
}

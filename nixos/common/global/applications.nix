{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    bat
    dust
    fd
    gdu
    libarchive
    lm_sensors
    nix-output-monitor
    ripgrep
  ];
}

{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    uutils-coreutils-noprefix
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

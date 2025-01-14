{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    uutils-coreutils-noprefix
    lm_sensors
    nix-output-monitor
  ];
}

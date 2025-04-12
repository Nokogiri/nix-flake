{
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [
    (writeShellScriptBin "balanced_ppd" ''
      ${lib.getBin pkgs.power-profiles-daemon}/bin/powerprofilesctl set balanced
    '')
    (writeShellScriptBin "performance_ppd" ''
      ${lib.getBin pkgs.power-profiles-daemon}/bin/powerprofilesctl set performance
    '')
    (writeShellScriptBin "powersave_ppd" ''
      ${lib.getBin pkgs.power-profiles-daemon}/bin/powerprofilesctl set power-saver
    '')
  ];
}

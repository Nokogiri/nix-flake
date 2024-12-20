{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  suspendScript = pkgs.writeShellScript "suspend-script" ''
    ${pkgs.pipewire}/bin/pw-cli i all 2>&1 | ${pkgs.ripgrep}/bin/rg running -q
    # only suspend if audio isn't running
    if [ $? == 1 ]; then
      ${pkgs.systemd}/bin/systemctl suspend
    fi
  '';
in {
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        beforeSleepCmd = "${pkgs.systemd}/bin/loginctl lock-session";
        lockCmd = lib.getExe config.programs.hyprlock.package;
      };
      listeners = [
        {
          timeout = 600;
          onTimeout = suspendScript.outPath;
        }
      ];
    };
  };
}

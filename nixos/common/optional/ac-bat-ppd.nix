{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    (writeShellScriptBin "balanced_ppd" ''
      ${pkgs.power-profiles-daemon}/bin/powerprofilesctl set balanced
    '')
    (writeShellScriptBin "performance_ppd" ''
      ${pkgs.power-profiles-daemon}/bin/powerprofilesctl set performance
    '')
    (writeShellScriptBin "powersave_ppd" ''
      ${pkgs.power-profiles-daemon}/bin/powerprofilesctl set power-saver
    '')
  ];

 # services.udev.extraRules = ''
 #   SUBSYSTEM=="power_supply",ATTR{online}=="0",RUN+="${pkgs.power-profiles-daemon}/bin/powerprofilesctl set power-saver"
 #   SUBSYSTEM=="power_supply",ATTR{online}=="1",RUN+="${pkgs.power-profiles-daemon}/bin/powerprofilesctl set balanced"
 # '';
}

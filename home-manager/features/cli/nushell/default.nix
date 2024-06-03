{ lib, ... }:
#with lib;
{
  programs.starship.enableNushellIntegration = true;
  programs.atuin.enableNushellIntegration = true;

  programs.carapace = {
    enable = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
  };
  programs.nushell = {
    enable = true;
    configFile.source = ./config.nu;
    envFile.source = ./env.nu;
  };
  xdg.configFile = {
    "nushell/carapace.nu".text = (
      lib.concatMapStringsSep "\n" lib.readFile [ ./carapace.nu ]
    );
  };
}

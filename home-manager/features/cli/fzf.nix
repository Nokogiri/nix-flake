{lib, ...}: {
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    colors = {
      bg = lib.mkForce "-1";
    };
    defaultOptions = [
      "--preview-window='border-rounded'"
      "--prompt=' '"
      "--marker='󰄳'"
      "--pointer='🠶'"
    ];
  };
}

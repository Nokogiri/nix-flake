{pkgs, ...}: {
  programs.opengamepadui = {
    enable = true;
    extraPackages = with pkgs; [gamescope mangohud];
    gamescopeSession.enable = false;
    inputplumber.enable = true;
    powerstation.enable = true;
  };
}

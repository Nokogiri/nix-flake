{pkgs, ...}: let
  automount_opts = "x-systemd.automount,noauto,uid=1000,gid=100,forceuid,forcegid,vers=3.0";
in {
  environment.systemPackages = [pkgs.cifs-utils];

  fileSystems."/media/Vault1" = {
    device = "//192.168.178.57/Vault1";
    fsType = "cifs";
    options = ["${automount_opts}"];
  };
  fileSystems."/media/Vault3" = {
    device = "//192.168.178.57/Vault3";
    fsType = "cifs";
    options = ["${automount_opts}"];
  };
}

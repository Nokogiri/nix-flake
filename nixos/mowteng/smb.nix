{ pkgs, ... }:
let
  automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=600,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s,uid=1000,gid=100,forceuid,forcegid,vers=3.0";
in
{
  environment.systemPackages = [ pkgs.cifs-utils ];

  fileSystems."/media/Vault11" = {
    device = "//192.168.178.57/Vault11";
    fsType = "cifs";
    options = [ "${automount_opts}" ];
  };
  fileSystems."/media/Vault31" = {
    device = "//192.168.178.57/Vault31";
    fsType = "cifs";
    options = [ "${automount_opts}" ];
  };
}

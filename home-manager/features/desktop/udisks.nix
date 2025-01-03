{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    (pkgs.writeShellScriptBin "udisksd" ''
      pathtoname() {
          udevadm info -p /sys/"$1" | awk -v FS== '/DEVNAME/ {print $2}'
      }

      stdbuf -oL -- udevadm monitor --udev -s block | while read -r -- _ _ event devpath _; do
              if [ "$event" = add ]; then
                devname=$(pathtoname "$devpath")
                udisksctl mount --block-device "$devname" --no-user-interaction
              fi
      done
    '')
  ];
  systemd.user.services.udisk-automounter = {
    Unit = {
      Description = "Automount USB Disks.";
      Documentation = "https://wiki.archlinux.org/title/Udisks#udevadm_monitor";
    };
    Service = {
      Type = "simple";
      ExecStart = "/etc/profiles/per-user/${config.home.username}/bin/udisksd";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = ["default.target"];
    };
  };
}

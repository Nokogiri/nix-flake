{
  boot = {
    plymouth = {
      enable = true;
      theme = "breeze";
    };
    loader.timeout = 0;
    kernelParams = [
      "fbcon=nodefer"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=true"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "quiet"
      "splash"
    ];
    consoleLogLevel = 0;
    initrd.verbose = false;
  };
}

{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-pc-ssd
    inputs.nur.modules.nixos.default
    ./hardware-configuration.nix

    ../common/global
    ../common/optional/ac-bat-ppd.nix
    ../common/optional/bluetooth.nix
    ../common/optional/desktop-common.nix
    ../common/optional/fprintd.nix
    ../common/optional/greetd.nix
    ../common/optional/libvirt.nix
    ../common/optional/mullvad.nix
    ../common/optional/pipewire.nix
    ../common/optional/quietboot.nix
    ../common/optional/ryzen-ppd.nix
    ../common/optional/sane.nix
    ../common/optional/steam.nix
    ../common/optional/systemd-boot.nix
    ../common/optional/systemd-network.nix
    ../common/optional/uwsm.nix
    ../common/optional/zramswap.nix

    ../common/users/nokogiri.nix

    ./firewall.nix
    ./network.nix
    ./smb.nix
  ];

  networking = {
    hostName = "mowteng";
    hostId = "05fc191c";
  };

  boot.kernel.sysctl = {
    "vm.max_map_count" = 2147483642;
  };

  environment.variables.AMD_VULKAN_ICD = lib.mkDefault "RADV";

  environment.systemPackages = with pkgs; [
    inputs.iwmenu.packages.${pkgs.system}.default
    amdctl
    compsize
    ryzen-ppd
  ];
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  nixpkgs.overlays = [
    inputs.hyprland-contrib.overlays.default
  ];
  powerManagement = {
    cpuFreqGovernor = "powersave";
    cpufreq = {
      min = 400000;
      max = 3000000;
    };
    powertop.enable = false;
  };

  programs = {
    light.enable = true;
    mtr.enable = true;
  };

  location = {
    provider = "manual";
    latitude = 50.9787;
    longitude = 11.03283;
  };

  security.polkit.enable = true;
  security.pam.loginLimits = [
    {
      domain = "nokogiri";
      item = "nice";
      type = "-";
      value = "-20";
    }
  ];
  services.acpid.enable = true;
  services.acpid.logEvents = false;

  services.logind = {
    extraConfig = ''
      RuntimeDirectorySize=8G
    '';
    powerKey = "ignore";
    powerKeyLongPress = "poweroff";
    lidSwitchDocked = "suspend-then-hibernate";
    lidSwitch = "suspend-then-hibernate";
  };
  systemd.sleep.extraConfig =
    #''
    #HibernateDelaySec=3600
    ''
      AllowSuspendThenHibernate=yes
    '';

  #services.desktopManager.cosmic.enable = true;
  #services.displayManager.cosmic-greeter.enable = true;
  #systemd.services.monitord.wantedBy = ["multi-user.target"];
  #environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;
  services.power-profiles-daemon.enable = true;

  services.speechd.enable = lib.mkForce false;

  services.udev.extraRules = ''
      ENV{ID_FS_USAGE}=="filesystem|other|crypto", ENV{UDISKS_FILESYSTEM_SHARED}="1"
    ACTION=="add", SUBSYSTEM=="serio", DRIVERS=="atkbd", ATTR{power/wakeup}="disabled"
  '';
  #systemd.tmpfiles.rules = ["D /tmp/.X11-unix 1777 nokogiri root"];
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "22.05";

  #virtualisation.waydroid.enable = true;
}

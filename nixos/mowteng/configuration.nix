# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix

    ../common/global
    ../common/optional/ac-bat-ppd.nix
    ../common/optional/bluetooth.nix
    ../common/optional/desktop-common.nix
    ../common/optional/greetd.nix
    ../common/optional/fprintd.nix
    ../common/optional/libvirt.nix
    ../common/optional/mullvad.nix
    ../common/optional/pipewire.nix
    ../common/optional/quietboot.nix
    ../common/optional/sane.nix
    ../common/optional/steam.nix
    ../common/optional/systemd-boot.nix
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
    # maximum possible
    "vm.max_map_count" = 2147483642; # 524288;
  };

  nixpkgs.config.permittedInsecurePackages = ["dotnet-runtime-7.0.20"];
  environment.variables.AMD_VULKAN_ICD = lib.mkDefault "RADV";

  environment.systemPackages = with pkgs; [
    amdctl
    compsize
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  powerManagement = {
    cpuFreqGovernor = "powersave";
    cpufreq = {
      min = 400000;
      max = 2500000;
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
  services.acpid.enable = true;
  services.acpid.logEvents = false;

  services.logind = {
    extraConfig = ''
      RuntimeDirectorySize=8G
    '';
    powerKey = "ignore";
    powerKeyLongPress = "poweroff";
    lidSwitchDocked = "suspend";
  };
  services.power-profiles-daemon.enable = true;
  services.speechd.enable = false;
  services.udev.extraRules = ''
    ENV{ID_FS_USAGE}=="filesystem|other|crypto", ENV{UDISKS_FILESYSTEM_SHARED}="1"
  '';

  systemd.tmpfiles.rules = ["D /tmp/.X11-unix 1777 nokogiri root"];
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "22.05";
}

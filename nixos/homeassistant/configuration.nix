# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  outputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-intel
    inputs.hardware.nixosModules.common-pc-ssd
    ./hardware-configuration.nix

    ../common/global

    ../common/optional/avahi.nix
    ../common/optional/grub-efi.nix
    ../common/optional/mbpfan.nix
    ../common/optional/mullvad.nix
    ../common/optional/resolved.nix
    ../common/optional/wireguard-server.nix
    ../common/optional/zramswap.nix
    ../common/users/nokogiri.nix

    ./services
    ./local
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
    ];
    config = {
      allowUnfree = true;
    };
  };

  networking = {
    hostName = "homeassistant";
    hostId = "2d3a30d6";
  };

  boot = {
    tmp.cleanOnBoot = true;
  };

  environment.systemPackages = with pkgs; [
    brightnessctl
    lm_sensors
    rclone
    sshfs-fuse
    podman-compose
  ];

  hardware.graphics = {
    enable = true;
    #extraPackages = with pkgs; [
    #  vaapiIntel # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
    #];
  };
  powerManagement = {
    cpuFreqGovernor = "schedutil";
    powertop.enable = false;
  };

  programs = {
    gnupg.agent.enable = true;
    light.enable = true;
    ssh.startAgent = true;
  };

  services.logind.lidSwitch = "ignore";

  location = {
    latitude = 50.9787;
    longitude = 11.03283;
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "22.05";
}

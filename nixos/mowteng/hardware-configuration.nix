{
  config,
  modulesPath,
  pkgs,
  ...
}:
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    extraModprobeConfig = ''
      blacklist pcspkr
      options cfg80211 ieee80211_regdom="DE"
      options iwlwifi 11n_disable=8 bt_coex_active=0
          '';
    extraModulePackages = with config.boot.kernelPackages; [
      cpupower
      ryzen-smu
      zenpower
    ];
    initrd = {
      availableKernelModules = [
        "nvme"
        "xhci_pci"
        "ahci"
      ];
      kernelModules = [
        "amdgpu"
        "amd_pmf"
        "amdtee"
      ];
    };
    kernelModules = [
      "kvm-amd"
      "zenpower"
      "wireguard"
    ];
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "amd_pstate=passive"
      "mitigations=off"
      "cpufreq.default_governor=onedmand"
          ];
    loader.efi.efiSysMountPoint = "/boot";
    supportedFilesystems = [ "btrfs" ];
    tmp.cleanOnBoot = true;
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/c8743301-ac42-42f6-9570-12f2f177148d";
      fsType = "btrfs";
      options = [
        "subvol=nixos/root"
        "compress-force=zstd"
      ];
    };

    "/var/lib" = {
      device = "/dev/disk/by-uuid/c8743301-ac42-42f6-9570-12f2f177148d";
      fsType = "btrfs";
      options = [
        "subvol=nixos/lib"
        "compress=zstd"
      ];
    };

    "/var/log" = {
      device = "/dev/disk/by-uuid/c8743301-ac42-42f6-9570-12f2f177148d";
      fsType = "btrfs";
      options = [
        "subvol=nixos/log"
        "compress=zstd"
      ];
    };

    "/nix" = {
      device = "/dev/disk/by-uuid/c8743301-ac42-42f6-9570-12f2f177148d";
      fsType = "btrfs";
      options = [
        "subvol=nixos/store"
        "compress=zstd"
      ];
    };

    "/home" = {
      device = "/dev/disk/by-uuid/c8743301-ac42-42f6-9570-12f2f177148d";
      fsType = "btrfs";
      options = [
        "subvol=@nokogiri"
        "compress=zstd"
      ];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/8C9D-013B";
      fsType = "vfat";
      options = [
        "fmask=0022"
        "dmask=0022"
        "codepage=437"
        "iocharset=ascii"
        "shortname=mixed"
        "utf8"
      ];
    };
  };

  swapDevices = [
    {
      device = "/dev/disk/by-uuid/93ae631f-7897-4c18-afd6-95d17c14ae2c";
      priority = 100;
    }
  ];

  hardware = {
    cpu.amd.updateMicrocode = true;
    sensor.iio.enable = true;
    steam-hardware.enable = true;
    uinput.enable = true;
    xpadneo.enable = false;
    xone.enable = false;
    wirelessRegulatoryDatabase = true;
  };

  #sound.enable = true;


  nixpkgs.hostPlatform = "x86_64-linux";
}

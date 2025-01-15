{
  config,
  modulesPath,
  pkgs,
  ...
}: {
  imports = [(modulesPath + "/installer/scan/not-detected.nix")];

  boot = {
    extraModprobeConfig = ''
      blacklist pcspkr
      options cfg80211 ieee80211_regdom="DE"
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
    #kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_latest;
    #kernelPackages = pkgs.linuxPackages_latest;
    #kernelPackages = pkgs.linuxKernel.packages.linux_lqx;
    kernelPackages = pkgs.linuxKernel.packages.linux_zen;
    #kernelPackages = pkgs.linuxKernel.packages.linux_latest;

    kernelParams = [
      "amd_pstate=active"
      "mitigations=off"
      "cpufreq.default_governor=powersave"
    ];
    loader.efi.efiSysMountPoint = "/boot";
    supportedFilesystems = ["btrfs"];
    tmp.cleanOnBoot = true;
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/c8743301-ac42-42f6-9570-12f2f177148d";
      fsType = "btrfs";
      options = [
        "subvol=nixos/root"
        "compress=zstd:6"
      ];
    };

    "/var/lib" = {
      device = "/dev/disk/by-uuid/c8743301-ac42-42f6-9570-12f2f177148d";
      fsType = "btrfs";
      options = [
        "subvol=nixos/lib"
        "compress=zstd:6"
      ];
    };

    "/var/log" = {
      device = "/dev/disk/by-uuid/c8743301-ac42-42f6-9570-12f2f177148d";
      fsType = "btrfs";
      options = [
        "subvol=nixos/log"
        "compress=zstd:6"
      ];
    };

    "/nix" = {
      device = "/dev/disk/by-uuid/c8743301-ac42-42f6-9570-12f2f177148d";
      fsType = "btrfs";
      options = [
        "subvol=nixos/store"
        "compress=zstd:6"
      ];
    };

    "/home" = {
      device = "/dev/disk/by-uuid/c8743301-ac42-42f6-9570-12f2f177148d";
      fsType = "btrfs";
      options = [
        "subvol=@nokogiri"
        "compress=zstd:6"
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
    wirelessRegulatoryDatabase = true;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
  nixpkgs.hostPlatform = "x86_64-linux";
}

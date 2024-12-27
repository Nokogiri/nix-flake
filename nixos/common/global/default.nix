# This file (and the global directory) holds config that i use on all hosts
{
  lib,
  inputs,
  outputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.nix-index-database.nixosModules.nix-index

    ./applications.nix
    ./console.nix
    ./fish.nix
    ./locale.nix
    ./openssh.nix
    ./sops.nix
    ./sudo.nix
  ];

  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = {
      inherit inputs;
    };
    backupFileExtension = "rebuildyss";
  };

  documentation = {
    info.enable = false;
    doc.enable = false;
    dev.enable = false;
  };

  environment = {
    enableAllTerminfo = false;
    pathsToLink = [
      "/share/nix-direnv"
      "/share/bash-completion"
    ];
  };
  systemd.coredump = {
    enable = false;
    extraConfig = ''
      Storage=none
      ProcessSizeMax=0
    '';
  };

  security.pam.loginLimits = [
    {
      domain = "*";
      item = "core";
      type = "hard";
      value = "0";
    }
    {
      domain = "*";
      item = "core";
      type = "soft";
      value = "0";
    }
    {
      domain = "@users";
      item = "rtprio";
      type = "-";
      value = 1;
    }
    {
      domain = "@wheel";
      item = "nofile";
      type = "soft";
      value = "524288";
    }
    {
      domain = "@wheel";
      item = "nofile";
      type = "hard";
      value = "1048576";
    }
  ];

  boot.kernel.sysctl = {
    "fs.suid_dumpable" = 0;
    "kernel.core_pattern" = "|${pkgs.busybox}/bin/false";
  };
  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      #outputs.overlays.unstable-packages
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };
  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      substituters = [
        "https://nix-community.cachix.org"
        #"https://cache.lix.systems"
        "https://hyprland.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        #"cache.lix.systems:aBnZUw8zA7H35Cz2RyKFVs3H4PlGTLawyY5KRbvJR8o="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
      trusted-users = [
        "root"
        "@wheel"
        "nokogiri"
      ];
      auto-optimise-store = lib.mkDefault false;
      experimental-features = [
        "nix-command"
        "flakes"
        "auto-allocate-uids"
      ];
      warn-dirty = false;
      keep-outputs = false;
      keep-derivations = true;
      cores = 8;
      max-jobs = 16;
    };
    # Opinionated: disable channels
    channel.enable = false;
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
    gc = {
      automatic = lib.mkDefault false;
      dates = "monthly";
    };

    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    #registry = lib.mapAttrs (_: value: { flake = value; }) inputs;
    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    #nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;
  };

  #programs.zsh.enable = true;
  programs = {
    fuse.userAllowOther = true;
    git.enable = true;
    nix-index-database.comma.enable = true;
    nix-index.enableZshIntegration = false;
    nix-index.enableBashIntegration = false;
  };
  hardware.enableRedistributableFirmware = true;

  # Increase open file limit for sudoers
}

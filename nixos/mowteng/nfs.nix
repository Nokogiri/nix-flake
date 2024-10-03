{ pkgs, ...}:{
  #services.rpcbind.enable = true; # needed for NFS
  environment.systemPackages = [ pkgs.nfs-utils ];
  systemd.mounts = let commonMountOptions = {
    type = "nfs";
    mountConfig = {
      Options = "rsize=131072,wsize=131072,noauto,vers=4";
    };
  };

  in

  [
    (commonMountOptions // {
      what = "10.200.200.1:/Vault0.1";
      where = "/media/Vault0.1";
    })

    (commonMountOptions // {
      what = "10.200.200.1:/Vault3.1";
      where = "/media/Vault3.1";
    })
  ];

  systemd.automounts = let commonAutoMountOptions = {
    wantedBy = [ "multi-user.target" ];
    automountConfig = {
      TimeoutIdleSec = "600";
    };
  };

  in

  [
    (commonAutoMountOptions // { where = "/media/Vault0.1"; })
    (commonAutoMountOptions // { where = "/media/Vault3.1"; })
  ];
}


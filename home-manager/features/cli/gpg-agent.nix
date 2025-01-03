{
  lib,
  pkgs,
  ...
}: {
  services = {
    gpg-agent = {
      enable = true;
      pinentryPackage = lib.mkDefault pkgs.pinentry-curses;
      enableSshSupport = false;
      enableZshIntegration = false;
      defaultCacheTtl = 60480000;
      defaultCacheTtlSsh = 60480000;
      maxCacheTtl = 60480000;
      maxCacheTtlSsh = 60480000;
      extraConfig = ''
        allow-loopback-pinentry
      '';
    };
  };
}

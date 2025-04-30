{pkgs, ...}: {
  services = {
    gnome-keyring = {
      enable = true;
      components = ["secrets"];
    };

    gpg-agent = {
      enable = true;
      pinentry.package = pkgs.pinentry-gnome3;
    };
  };
}

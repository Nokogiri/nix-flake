{ pkgs, ... }:
{
  virtualisation.libvirtd = {
    enable = true;
    qemu.swtpm.enable = true;
  };
  virtualisation.spiceUSBRedirection.enable = true;
  environment.systemPackages = [ pkgs.spice-gtk ];
  programs.virt-manager.enable = true;
}

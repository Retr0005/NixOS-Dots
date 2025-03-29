{ pkgs, config, host, username, options, lib, inputs, system, ... }: {
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ "mao" ];

  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };
}

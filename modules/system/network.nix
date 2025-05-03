{
  pkgs,
  pkgs-master,
  config,
  host,
  username,
  options,
  lib,
  inputs,
  system,
  ...
}: {
  networking = {
    networkmanager = {
      enable = true;
      package = pkgs.pkgs-master.networkmanager;
    };
    hostName = "${host}";
    timeServers = options.networking.timeServers.default ++ ["pool.ntp.org"];

    firewall = {
      enable = true;
    };
  };
}

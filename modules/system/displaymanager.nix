{
  pkgs,
  config,
  host,
  username,
  options,
  lib,
  inputs,
  system,
  ...
}:
with lib; let
  cfg = config.system.displayManager;
in {
  options.system.displayManager = {
    enable = mkEnableOption "Enable Display Manager Services";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.kdePackages.qtsvg
      pkgs.kdePackages.qtmultimedia
      pkgs.kdePackages.qtvirtualkeyboard
      (pkgs.callPackage ../../pkgs/sddm-astronaut-theme.nix {
        theme = "pixel_sakura";
      })
    ];
    services.xserver.enable = true;
    services.displayManager.defaultSession = "hyprland-uwsm";
    services.displayManager.sddm = {
      enable = true; # Enable SDDM.
      package = pkgs.kdePackages.sddm;
      extraPackages = with pkgs; [
        kdePackages.qtsvg
        kdePackages.qtmultimedia
        kdePackages.qtvirtualkeyboard
      ];
      wayland.enable = true;
      theme = "sddm-astronaut-theme";
      settings = {
        Theme = {
          CursorTheme = "Bibata-Modern-Ice";
        };
      };
    };
    programs.uwsm = {
      enable = true;
      waylandCompositors = {
        hyprland = {
          prettyName = "Hyprland";
          comment = "Hyprland compositor manager by UWSM";
          binPath = "/run/current-system/sw/bin/Hyprland";
        };

        wayfire = {
          prettyName = "Wayfire";
          comment = "Shit's fire af";
          binPath = "/run/current-system/sw/bin/wayfire";
        };
      };
    };
  };
}

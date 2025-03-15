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
  cfg = config.system.plymouth;
in {
  options.system.plymouth = {
    enable = mkEnableOption "Enable plymouth";
  };

  config = mkIf cfg.enable {
    #catppuccin.tty.enable = true;
    boot = {
      plymouth = {
          enable = true;
          theme = "optimus";
          themePackages = with pkgs; [
            (adi1090x-plymouth-themes.override {
                selected_themes = [ "optimus" ];
             })
          ];
      };

      consoleLogLevel = 0;
      initrd.verbose = false;
      kernelParams = [
        "quiet"
        "splash"
        "boot.shell_on_fail"
        "loglevel=3"
        "rd.udev.lo_level=3"
        "udev.log_priority=3"
      ];
    };
  };
}

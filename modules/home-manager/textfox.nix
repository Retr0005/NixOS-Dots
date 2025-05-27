{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.textfox.homeManagerModules.default
  ];

  textfox = {
    enable = true;
    profile = "default";
    config = {
      background = {
        color = "#181825";
      };

      border = {
        color = "#89b4fa";
        width = "3px";
        transition = "1.0s ease";
        radius = "5px";
      };
      displayNavButtons = true;
      newtabLogo = "   __            __  ____          \A   / /____  _  __/ /_/ __/___  _  __\A  / __/ _ \\| |/_/ __/ /_/ __ \\| |/_/\A / /_/  __/>  </ /_/ __/ /_/ />  <  \A \\__/\\___/_/|_|\\__/_/  \\____/_/|_|  ";

      font = {
        family = "CaskaydiaMono Nerd Font Proto";
        size = "14px";
        accent = "#89b4fa";
      };

      tabs = {
        vertical = {
          margin = "1.0rem";
        };
        horizontal = {
          enable = false;
        };
      };

    };
  };
}

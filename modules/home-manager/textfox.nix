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
        color = "#C4A7E7";
        width = "3px";
        transition = "1.0s ease";
        radius = "5px";
      };
      displayNavButtons = true;
      newtabLogo = "   __            __  ____          \A   / /____  _  __/ /_/ __/___  _  __\A  / __/ _ \\| |/_/ __/ /_/ __ \\| |/_/\A / /_/  __/>  </ /_/ __/ /_/ />  <  \A \\__/\\___/_/|_|\\__/_/  \\____/_/|_|  ";

      font = {
        family = "Dank Mono Nerd Font";
        size = "14px";
        accent = "#C4A7E7";
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

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
        color = "#ebbcba";
        width = "3px";
        transition = "1.0s ease";
        radius = "5px";
      };
      displayHorizontalTabs = false;
      displayNavButtons = true;
      newtabLogo = "   __            __  ____          \A   / /____  _  __/ /_/ __/___  _  __\A  / __/ _ \\| |/_/ __/ /_/ __ \\| |/_/\A / /_/  __/>  </ /_/ __/ /_/ />  <  \A \\__/\\___/_/|_|\\__/_/  \\____/_/|_|  ";

      font = {
        family = "CaskaydiaMono Nerd Font Proto";
        size = "14px";
        accent = "#ebbcba";
      };

      sidebery = {
        margin = "1.0rem";
      };
    };
  };
}

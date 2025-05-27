{ 
  config, 
  pkgs, 
  inputs,
  lib,
  ... 
}: {
  imports = [
    inputs.hyprland.homeManagerModules.default
    inputs.catppuccin.homeManagerModules.catppuccin
  ];
  programs = {
    direnv = {
      enable = true;
    };
    bottom = {
      enable = true;
    };
    lsd = {
      enable = true;
    };
    btop = {
      enable = true;
      settings = {
        color_theme = lib.mkForce "stylix";
      };
    };
    htop = {
      enable = true;
    };
    gh = {
      enable = true;
      package = pkgs.gh;
    };
    bat = {
      enable = true;
      config.theme = lib.mkForce "base16-stylix";
    };
  };
  catppuccin.enable = true;

  qt = {
    enable = true;
    platformTheme.name = lib.mkForce "kvantum";
    style.name = lib.mkForce "kvantum";
  };

  home.file = {
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "wezterm";
    VISUAL = "codium";
    BROWSER = "firefox";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

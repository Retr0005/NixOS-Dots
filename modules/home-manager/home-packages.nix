{
  config,
  lib,
  pkgs,
  system,
  inputs,
  options,
  ...
}: {
  
  home.packages = with pkgs; [
    #rustup
    neovim
    firefox
    github-cli
    neovide
    wezterm
    hyprpicker  
    hyprpanel
    inputs.nyxexprs.packages.${pkgs.system}.ani-cli
    inputs.ags.packages.${pkgs.system}.agsFull
    inputs.hyprsunset.packages.${pkgs.system}.hyprsunset
    inputs.zen-browser.packages."${pkgs.system}".default 
    pkgs-master.microfetch
    inputs.yazi.packages.${pkgs.system}.yazi
    gpu-screen-recorder
    libqalculate
    dbus-glib
    gtkmm4
    tmux
    gtk4
  ];
}

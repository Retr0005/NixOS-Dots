{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    jetbrains.idea-ultimate
    jetbrains-toolbox
    jdk
    scenebuilder

    qbittorrent-enhanced
    umlet
    plantuml
    zellij
    lua-language-server

    pokemonsay
    krabby
    tree-sitter
    ascii-image-converter
    rar
    cdemu-client
    cdemu-daemon
    thefuck

    qemu
    mesa-demos
    gradle
    go
    gnumake
    neovim
    firefox
    cmatrix
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

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

    qbittorrent
    umlet
    plantuml
    zellij
    lua-language-server

    netflix
    pokemonsay
    krabby
    tree-sitter
    ascii-image-converter
    rar
    cdemu-client
    cdemu-daemon
    thefuck
    mangohud
    thunderbird
    gearlever

    gnome-themes-extra
    adwaita-icon-theme
    onlyoffice-desktopeditors
    dropbox
    gamepad-tool
    antimicrox
    eww
    shadps4
    lm_sensors

    qemu
    mesa-demos
    gradle
    go
    gnumake
    inputs.neovim-nightly-overlay.packages.${pkgs.system}.default
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
    neofetch

    # Random sheet
    tetris
  ];
}

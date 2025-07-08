{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    jdk
    scenebuilder

    rust-bin.stable.latest.default

    # LSPs
    jdt-language-server
    lua-language-server
    rust-analyzer
    sourcekit-lsp
    statix
    clang-tools

    freecad-wayland
    kicad-unstable
    foliate
    wireshark

    qbittorrent
    plantuml
    zellij
    gimp-with-plugins
    rmpc
    obs-studio

    gsettings-desktop-schemas
    libGL
    libGLU
    xz
    devenv
    nix-prefetch

    pokemonsay
    krabby
    tree-sitter
    ascii-image-converter
    rar

    gnome-themes-extra
    adwaita-icon-theme
    dropbox
    lm_sensors
    bc
    vimgolf
    watchexec
    pipes

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
    hyprpicker
    hyprpanel
    inputs.ags.packages.${pkgs.system}.agsFull
    inputs.hyprsunset.packages.${pkgs.system}.hyprsunset
    inputs.zen-browser.packages."${pkgs.system}".default
    inputs.walker.packages.${pkgs.system}.default
    pkgs-master.microfetch
    gpu-screen-recorder
    libqalculate
    dbus-glib
    gtkmm4
    tmux
    gtk4
    neofetch
    alacritty
  ];
}

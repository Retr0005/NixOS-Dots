{
  pkgs,
  pkgs-master,
  config,
  inputs,
  lib,
  options,
  chaotic,
  ...
}: {
  # _module.args.pkgs-master = import inputs.nixpkgs-master {
  #   inherit (pkgs.stdenv.hostPlatform) system;
  #   inherit (config.nixpkgs) config;
  # };
  environment.systemPackages = with pkgs; [
    ags_1
    brightnessctl # for brightness control
    libinput
    libinput-gestures
    cliphist
    eog
    wineWowPackages.waylandFull
    lutris
    tor-browser
    gnome-system-monitor
    file-roller
    grim
    protonvpn-gui
    hiddify-app
    gtk-engine-murrine #for gtk themes
    hyprcursor # requires unstable channel
    hypridle # requires unstable channel
    imagemagick
    inxi
    jq
    kitty
    libsForQt5.qtstyleplugin-kvantum #kvantum
    pkgs-master.networkmanagerapplet
    nwg-look # requires unstable channel
    nwg-dock-hyprland
    # nvtopPackages.full
    #inputs.nixpkgs-master.legacyPackages.${pkgs.system}.pamixer
    pkgs-master.pamixer
    pkgs-master.gitui
    pavucontrol
    playerctl
    polkit_gnome
    pyprland
    libsForQt5.qt5ct
    # kdePackages.full
    qt6ct
    qt6.qtwayland
    qt6Packages.qtstyleplugin-kvantum #kvantum
    rofi-wayland
    slurp
    swappy
    swww
    unzip
    wallust
    wl-clipboard
    wlogout
    yad
    yt-dlp
    nix-ld
    power-profiles-daemon
    fd
    home-manager
    bluez-tools
    #wgpu-utils
    gtk3
    gtk4
    fish
    atuin
    bun
    dart-sass
    nodejs
    sassc
    libgtop
    starship
    telegram-desktop
    vesktop
    papirus-folders
    papirus-icon-theme
    spotify
    zoxide
    bibata-cursors
    vivid
    (pkgs.callPackage ../../pkgs/nitch.nix {})
    nurl
    gamescope
    libpng
    glibc

    # shadps4 packages
    clang
    cmake
    pkg-config

    alsa-lib
    pulseaudio
    libpulseaudio
    openal
    openssl
    zlib
    libedit
    udev
    libevdev
    SDL2
    jack2
    sndio
    qt6.qtbase
    qt6.qttools
    qt6.qtmultimedia

    vulkan-headers
    vulkan-utility-libraries
    vulkan-validation-layers
    vulkan-tools

    kdePackages.qtbase
    kdePackages.qtdeclarative
    kdePackages.qtmultimedia
    kdePackages.qttools
    kdePackages.qtwayland
    kdePackages.full

    ffmpeg_6-full
    fmt
    glslang
    libxkbcommon
    xorg.libxcb
    xorg.libXext
    xorg.libX11
    xorg.xcbutil
    xorg.xcbutilkeysyms
    xorg.xcbutilwm

    spirv-tools
    sdl3
    stb
    qt6.qtwayland
    wayland-protocols

    protonup-qt
    bottles
    libglvnd
    dxvk
    winetricks
    libstrangle
    gamemode
  ];
}

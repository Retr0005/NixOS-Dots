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
    nwg-look # requires unstable channel
    nwg-dock-hyprland
    pkgs-master.jetbrains.idea-ultimate
    pkgs-master.networkmanagerapplet
    pkgs-master.pamixer
    #pkgs-master.spotify
    pkgs-master.gitui
    pavucontrol
    playerctl
    polkit_gnome
    pyprland
    libsForQt5.qt5ct
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
    zoxide
    bibata-cursors
    vivid
    (pkgs.callPackage ../../pkgs/nitch.nix {})
    nurl
    gamescope
    libpng
    glibc

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
    pkg-config
    jujutsu_git
    nix-output-monitor
    nvd
  ];
}

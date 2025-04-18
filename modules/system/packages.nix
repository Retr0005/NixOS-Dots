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
  ];
}

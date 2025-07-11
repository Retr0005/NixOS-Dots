# Main default config
{
  config,
  pkgs,
  host,
  username,
  options,
  lib,
  inputs,
  outputs,
  system,
  ...
}: let
  inherit (import ./variables.nix) keyboardLayout;
  python-packages = pkgs.python3.withPackages (ps:
    with ps; [
      requests
      pyquery # needed for hyprland-dots Weather script
    ]);
in {
  imports = [
    ./hardware.nix
    ./users.nix
    ../../modules/system
  ];

  nixpkgs.overlays = [
    (final: prev: {
      sf-mono-liga-bin = prev.stdenvNoCC.mkDerivation rec {
        pname = "sf-mono-liga-bin";
        version = "dev";
        src = inputs.sf-mono-liga-src;
        dontConfigure = true;
        installPhase = ''
          mkdir -p $out/share/fonts/opentype
          cp -R $src/*.otf $out/share/fonts/opentype/
        '';
      };
      pkgs-master = import inputs.nixpkgs-master {
        system = final.system;
        config.allowUnfree = true;
      };
      pkgs-stable = import inputs.nixpkgs-stable {
        system = final.system;
        config.allowUnfree = true;
      };
    })
  ];

  drivers = {
    intel.enable = true;
  };
  vm.guest-services.enable = false;
  local.hardware-clock.enable = true;
  system = {
    kernel.enable = true;
    bootloader.enable = true;
    plymouth.enable = true;
    audio.enable = true;
    displayManager.enable = true;
    powermanagement.enable = true;
    btrfs.enable = false;
    zfs.enable = true;
    zram.enable = true;
  };
  #boot.loader.systemd-boot.enable = true;
  #boot.loader.efi.canTouchEfiVariables = true;
  catppuccin.tty.enable = true;
  services.xserver.videoDrivers = ["modesetting"];
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
  };
  users = {mutableUsers = true;};

  programs.nix-ld.enable = true;

  environment.systemPackages =
    (with pkgs; [
      lua

      fishPlugins.done
      fishPlugins.fzf-fish
      fzf
      fishPlugins.hydro
      fishPlugins.grc
      grc
      fishPlugins.autopair

      libva-utils
      libvdpau-va-gl
      intel-compute-runtime
      intel-vaapi-driver
      vaapiVdpau
      mesa
      egl-wayland
      pkgs-master.waybar # if wanted experimental next line
      pkgs-master.spotify
    ])
    ++ [python-packages];
  # OpenGL
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [vulkan-tools];
      extraPackages32 = with pkgs.pkgsi686Linux; [vulkan-tools];
    };
  };

  console.keyMap = "dvorak";
  # For Electron apps to use wayland
  environment.variables = {
    VDAPU_DRIVER =
      lib.mkIf config.hardware.graphics.enable (lib.mkDefault "va_gl");
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "wezterm";
    VISUAL = "vscodium";
    GSK_RENDERER = "gl";
  };
  system.stateVersion = "25.05"; # Did you read the comment?
}

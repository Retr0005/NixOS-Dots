{
  description = "A based config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:NixOS/nixpkgs/master";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    nix = {
      url = "github:NixOS/nix/2.26-maintenance";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    anyrun.url = "github:fufexan/anyrun/launch-prefix";
    nix-alien.url = "github:thiagokokada/nix-alien";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    catppuccin.url = "github:catppuccin/nix";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-anywhere = {
      url = "github:numtide/nixos-anywhere";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.disko.follows = "disko";
    };
    nvf.url = "github:notashelf/nvf";
    yazi.url = "github:sxyazi/yazi";
    sf-mono-liga-src = {
      url = "github:shaunsingh/SFMono-Nerd-Font-Ligaturized";
      flake = false;
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    walker.url = "github:abenz1267/walker";
    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprsunset = {url = "github:hyprwm/hyprsunset";};
    ghostty = {url = "github:ghostty-org/ghostty";};
    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord = {url = "github:kaylorben/nixcord";};
    custom-nixpkgs = {
      url = "github:maotseantonio/custom-nixpkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    textfox.url = "github:adriankarlen/textfox";
    hyprland.url = "git+https://github.com/hyprwm/hyprland?ref=refs/tags/v0.47.2&submodules=1";
    stylix = {
      url = "github:danth/stylix";
      #inputs.nixpkgs.follows = "nixpkgs";
      #inputs.home-manager.follows = "home-manager";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    nyxexprs.url = "github:notashelf/nyxexprs";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nh.url = "github:viperML/nh";
    nur.url = "github:nix-community/NUR";
    lix = {
      url = "https://git.lix.systems/lix-project/lix/archive/main.tar.gz";
      flake = false;
    };
    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/main.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.lix.follows = "lix";
    };
    zjstatus = {url = "github:dj95/zjstatus";};
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs @ {
    self,
    nixpkgs,
    nixpkgs-master,
    nixpkgs-stable,
    home-manager,
    chaotic,
    lix-module,
    nvf,
    nixvim,
    custom-nixpkgs,
    zjstatus,
    ...
    }: let
      system = "x86_64-linux";
      host = "Laptop";
      username = "mao";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs-master = import nixpkgs-master {
        inherit system;
        config.allowUnfree = true;
      };
      overlays = import ./overlays {inherit inputs;};
    in {
      nixosConfigurations = {
        "${host}" = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit system;
            inherit inputs;
            inherit username;
            inherit host;
            inherit chaotic;
            inherit pkgs-master;
          };
          modules = [
            ./hosts/${host}/config.nix
            inputs.chaotic.nixosModules.default
            inputs.home-manager.nixosModules.home-manager
            inputs.stylix.nixosModules.stylix
            inputs.catppuccin.nixosModules.catppuccin
            inputs.nixos-hardware.nixosModules.huawei-machc-wa
            lix-module.nixosModules.default
            inputs.nvf.nixosModules.default
            {
              nixpkgs.overlays = [
                inputs.hyprpanel.overlay
                inputs.niri.overlays.niri
                inputs.rust-overlay.overlays.default
                custom-nixpkgs.overlays.default
                (final: prev: {
                  stable = import nixpkgs-stable {
                    config.allowUnfree = true;
                    config.nvidia.acceptLicense = true;
                  };
                  zjstatus = zjstatus.packages.${pkgs.system}.default;
                })
              ];
            }
          ];
        };
      };
    };
}

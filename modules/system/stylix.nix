{
  pkgs,
  config,
  host,
  username,
  options,
  lib,
  inputs,
  system,
  ...
}: {
    stylix = {
        enable = true;
        autoEnable = false;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
        targets.spicetify.enable = true;
        targets.gtk.enable = true;
        targets.fish.enable = true;
        polarity = "dark";
        targets.nixos-icons.enable = true;
        image = "/home/antonio/Pictures/wallpapers/luffy1_catppuccin-mocha.png";
        fonts = {
            sizes = {
                terminal = 14;
                applications = 12;
                popups = 12;
            };

            serif = {
                name = "JetBrainsMono Nerd Font";
                package = pkgs.nerd-fonts.jetbrains-mono;
            };

            sansSerif = {
                name = "JetBrainsMono Nerd Font";
                package = pkgs.nerd-fonts.jetbrains-mono;
            };

            monospace = {
                package = pkgs.nerd-fonts.jetbrains-mono;
                name = "JetBrainsMono Nerd Font";
            };

            emoji = {
                package = pkgs.noto-fonts-emoji;
                name = "Noto Color Emoji";
            };
        };
    };
}


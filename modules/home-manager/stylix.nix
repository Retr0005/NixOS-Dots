{
  pkgs,
  ...
}: {
    stylix = {
        enable = true;
        #autoEnable = false;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
        targets = {
            gtk.enable = true;
            fish.enable = true;
        };
        polarity = "dark";
        #targets.nixos-icons.enable = true;
        image = ./assets/pastel-car.png;
        fonts = {
            sizes = {
                terminal = 13;
                applications = 12;
                popups = 12;
            };

            serif = {
                name = "CaskaydiaCove Nerd Font";
                package = pkgs.nerd-fonts.caskaydia-mono;
            };

            sansSerif = {
                name = "CaskaydiaCove Nerd Font";
                package = pkgs.nerd-fonts.caskaydia-mono;
            };

            monospace = {
                package = pkgs.nerd-fonts.caskaydia-mono;
                name = "CaskaydiaCove Nerd Font";
            };

            emoji = {
                package = pkgs.noto-fonts-emoji;
                name = "Noto Color Emoji";
            };
        };
    };
}


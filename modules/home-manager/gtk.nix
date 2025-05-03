{
  pkgs,
  config,
  inputs,
  ...
}: {
  gtk = {
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome.gnome-themes-extra;
      font = {
        name = "CaskaydiaCove Nerd Font";
        size = 14;
      };
    };

    iconTheme = {
      name = "Papirus-Dark";
      packages = pkgs.papirus-icon-theme;
    };
    #theme.packages = pkgs.catppuccin-gtk.override {
    #accents = ["mauve"]; # You can specify multiple accents here to output multiple themes
    #size = "standard";
    #variant = "mocha";
    #};
    #theme.name = "catppuccin-Dark";
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    font = {
      name = "CaskaydiaCove Nerd Font";
      size = 14;
    };
  };
}

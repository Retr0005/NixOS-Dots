{
  lib,
  ...
}: {
  programs.hyprlock = lib.mkForce {
    enable = true;
    settings = {
      # General
      general = {
        no_fade_in = true;
        grace = 1;
        disable_loading_bar = false;
        hide_cursor = true;
        ignore_empty_input = true;
        text_trim = true;
      };

      # Background 
      background = [{
        monitor = "";
        path = "~/Pictures/fishing.png";
        blur_passes = 2;
        contrast = 0.8916;
        brightness = 0.7172;
        vibrancy = 0.1696;
        vibrancy_darkness = 0;
      }];

      image = [{         
        monitor = "";
        path = "~/Pictures/rain.jpg";
        size = 60;
        rounding = 5;
        border_size = 0;
        rotate = 0;
        reload_time = 2;
        #reload_cmd = "~/NixOS-Dots/modules/home-manager/hyprlock/scripts/playerctlock.sh --arturl";
        position = "-150, -300";
        halign = "center";
        valign = "center";
        opacity = 0.5;
      }];

      label = [
        # Time HR
        {
          monitor = "";
          text = "cmd[update:1000] echo -e \"$(date +\"%H\")\"";
          color = "rgb(255,255,255)";
          shadow_pass = 2;
          shadow_size = 3;
          shadow_color = "rgb(0,0,0)";
          shadow_boost = 1.2;
          font_size = 150;
          font_family = "JetBrains Mono Nerd Font Mono ExtraBold";
          position = "0, -250";
          halign = "center";
          valign = "top";
        }

        # Time MN
        {
          monitor = "";
          text = "cmd[update:1000] echo -e \"$(date +\"%M\")\"";
          color = "rgb(255,255,255)";
          font_size = 150;
          font_family = "JetBrains Mono Nerd Font Mono ExtraBold";
          position = "0, -420";
          halign = "center";
          valign = "top";
        }


        # Date 
        {
          monitor = "";
          text = "cmd[update:1000] echo -e \"$(date +\"%d %b %A\")\"";
          color = "rgba(255,255,255,1)";
          font_size = 14;
          font_family = "CaskaydiaMono Nerd Font";
          position = "0, -130";
          halign = "center";
          valign = "center";
        }

        # Player Title 
        {
          monitor = "";
          text = "cmd[update:1000] echo \"$(~/NixOS-Dots/modules/home-manager/hyprlock/scripts/playerctlock.sh --title)\"";
          color = "rgba(255,255,255,0.8)";
          font_size = 12;
          font_family = "CaskaydiaMono Nerd Font";
          position = "880, -290";
          halign = "left";
          valign = "center";
        }

        # Player Length 
        {
          monitor = "";
          text = "cmd[update:1000] echo \"$(~/NixOS-Dots/modules/home-manager/hyprlock/scripts/playerctlock.sh --length)\"";
          color = "rgba(255,255,255,1)";
          font_size = 1;
          font_family = "CaskaydiaMono Nerd Font";
          position = "-730, -310";
          halign = "right";
          valign = "center";
        }
        # Player Status
        {
          monitor = "";
          text = "cmd[update:1000] echo \"$(~/NixOS-Dots/modules/home-manager/hyprlock/scripts/playerctlock.sh --status)\"";
          color = "rgba(255,255,255,1)";
          font_size = 14;
          font_family = "CaskaydiaMono Nerd Font";
          position = "-740, -290";
          halign = "right";
          valign = "center";
        }

        # Player Source
        {
          monitor = "";
          text = "cmd[update:1000] echo \"$(~/NixOS-Dots/modules/home-manager/hyprlock/scripts/playerctlock.sh --source)\"";
          color = "rgba(255,255,255,0.6)";
          font_size = 10;
          font_family = "CaskaydiaMono Nerd Font";
          position = "-740, -330";
          halign = "right";
          valign = "center";
        }

        # Player Album
        {
          monitor = "";
          text = "cmd[update:1000] echo \"$(~/NixOS-Dots/modules/home-manager/hyprlock/scripts/playerctlock.sh --album)\"";
          color = "rgba(255,255,255,1)";
          font_size = 10;
          font_family = "CaskaydiaMono Nerd Font";
          position = "880, -330";
          halign = "left";
          valign = "center";
        }

        # Player Artist
        {
          monitor = "";
          text = "cmd[update:1000] echo \"$(~/NixOS-Dots/modules/home-manager/hyprlock/scripts/playerctlock.sh --artist)\"";
          color = "rgba(255,255,255,0.8)";
          font_size = 10;
          font_family = "CaskaydiaMono Nerd Font";
          position = "880, -310";
          halign = "left";
          valign = "center";
        }

        # Infos 
        {
          monitor = "";
          text = "cmd[update:1000] echo \"$(~/NixOS-Dots/modules/home-manager/hyprlock/scripts/infos.sh)\"";
          color = "rgba(255,255,255,1)";
          font_size = 12;
          font_family = "CaskaydiaMono Nerd Font";
          position = "-20, -510";
          halign = "right";
          valign = "center";
        }
      ];

      # Input Field 
      input-field = {
        monitor = "";
        size = "250, 60";
        outline_thickness = 0;
        outer_color = "rgba(0,0,0,1)";
        dots_size = "0, 1";
        dots_spacing = 1;
        dots_center = true;
        inner_color = "rgba(0,0,0,1)";
        font_color = "rgba(200,200,200,1)";
        fade_on_empty = false;
        font_family = "CaskaydiaMono Nerd Font";
        placeholder_text = "<span foreground=\"##cdd6f4\"> $USER</span>";
        hide_input = false;
        position = "0, -470";
        halign = "center";
        valign = "center";
        zindex = 10;
      };

    };
  };
}

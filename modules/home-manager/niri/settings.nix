{
config,
pkgs,
inputs,
...
}: let
  #pointer = config.home.pointerCursor;
  makeCommand = command: {
    command = [command];
  };
in {
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-gnome pkgs.gnome-keyring]; 
  home.packages = [pkgs.wl-clipboard inputs.astal.packages.${pkgs.system}.default ];

  programs.niri = { 
    enable = true;
    package = pkgs.niri-unstable;
    settings = {
      layer-rules = [
        {
          matches = [
            {
              namespace = "^swww-daemon$"; 
            }          
          ];
        }
      ];
      environment = {
        CLUTTER_BACKEND = "wayland";
        DISPLAY = null;
        GDK_BACKEND = "wayland,x11";
        MOZ_ENABLE_WAYLAND = "1";
        NIXOS_OZONE_WL = "1";
        QT_QPA_PLATFORM = "wayland;xcb";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        SDL_VIDEODRIVER = "wayland";
        QT_QPA_PLATFORMTHEME = "qt6ct";
        QT_STYLE_OVERRIDE = "kvantum";
        GTK_THEME = "Material-DeepOcean-BL-LB";
        ELECTRON_OZONE_PLATFORM_HINT = "auto";
        OZONE_PLATFORM = "wayland";
        JAVA_AWT_WM_NONEREPARENTING = "1";
        #ANI_CLI_PLAYER = "vlc";
        #WAYLAND_DISPLAY = "$XDG_RUNTIME_DIR/$WAYLAND_DISPLAY";
      };
      spawn-at-startup = [
        (makeCommand "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1")
        (makeCommand "wl-paste --type image --watch cliphist store")
        (makeCommand "wl-paste --type text --watch cliphist store")
        (makeCommand "wl-paste --watch walker --update-clipboard")
        (makeCommand "swww-daemon")
        (makeCommand "waybar")
        (makeCommand "uwsm finalize")
        (makeCommand "blueman-applet")
        (makeCommand "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
        #(makeCommand "${pkgs.xwayland-satellite}/bin/xwayland-satellite")
        (makeCommand "${pkgs.xdg-desktop-portal-gnome}/libexec/xdg-desktop-portal-gnome")
      ];
      input = {
        keyboard = {
          xkb = {
            layout = "us";
            variant = "dvorak";
          };
          repeat-delay = 200;
          repeat-rate = 50;
        };
        touchpad = {
          click-method = "button-areas";
          dwt = true;
          dwtp = true;
          natural-scroll = true;
          scroll-method = "two-finger";
          tap = true;
          tap-button-map = "left-right-middle";
          middle-emulation = true;
          accel-profile = "adaptive";
          scroll-factor = 0.7;
        };
        focus-follows-mouse.enable = true;
        warp-mouse-to-focus = true;
        workspace-auto-back-and-forth = true;
      };
      overview = { backdrop-color = "#11121d"; };# Tokyo Night background color
      screenshot-path = "~/Pictures/Screenshots/Screenshot-from-%Y-%m-%d-%H-%M-%S.png";
      outputs = {
        "eDP-1" = {
          mode = {
            width = 2160;
            height = 1440;
            refresh = null;
          };
          scale = 1.0;
          position = {
            x = 0;
            y = 0;
          };
          backdrop-color = "transparent";
          background-color = "transparent";
        };
        "HDMI-A-1" = {
          mode = {
            width = 1920;
            height = 1080;
            refresh = null;
          };
          scale = 1.0;
          position = {
            x = 0;
            y = -1080;
          };
        };
      };
      cursor = {
        size = 32;
        theme = "LyraR-cursors";
      };
      #background = "#11121d"; # Tokyo Night background color

      #
      # ██╗     █████╗ ██╗   ██╗ ██████╗ ██╗   ██╗████████╗
      # ██║     ██╔══██╗╚██╗ ██╔╝██╔═══██╗██║   ██║╚══██╔══╝
      # ██║     ███████║ ╚████╔╝ ██║  ██║██║   ██║   ██║
      # ██║     ██╔══██║  ╚██╔╝  ██║  ██║██║   ██║   ██║
      # ███████╗██║  ██║   ██║   ╚██████╔╝╚██████╔╝   ██║
      # ╚══════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝  ╚═════╝    ╚═╝
      #

      layout = {
        gaps = 9;
        center-focused-column = "never";
        preset-column-widths = [
          { proportion = 0.25; }
          { proportion = 0.5; }
          { proportion = 0.75; }
          { proportion = 1.0; }
        ];

        default-column-width = { proportion = 0.50; };

        focus-ring = {
          width = 2;
          active = {
            gradient = {
              from = "#e97078"; # Tokyo Night red
              to = "#80c8ff"; # Tokyo Night purple/magenta
              angle = 150; # Diagonal gradient
            };
          };
          inactive = {
            gradient = {
              from = "#414868"; # Dark gray (Tokyo Night)
              to = "#1e1e2e"; # Fade to muted red
              angle = 180;
            };
          };
        };

        always-center-single-column = true;

        border = {
          enable = false;
        };

        shadow = {
          enable = true;
          softness = 20;
          spread = 7;
          offset = { x = -1; y = -5; };
          color = "#0009";
        };
        struts = {};
      };

      # NOTE: Animations
      #
      #  █████╗ ███╗   ██╗██╗███╗   ███╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗
      # ██╔══██╗████╗  ██║██║████╗ ████║██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║
      # ███████║██╔██╗ ██║██║██╔████╔██║███████║   ██║   ██║██║  ██║██╔██╗ ██║
      # ██╔══██║██║╚██╗██║██║██║╚██╔╝██║██╔══██║   ██║   ██║██║  ██║██║╚██╗██║
      # ██║  ██║██║ ╚████║██║██║ ╚═╝ ██║██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║
      # ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝    ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
      #
      animations = {
        enable = true; # Or false if you want animations on
        slowdown = 1.2;

        window-open = {
          easing = {
            curve = "linear";
            duration-ms = 200;
          };
        };
        window-close = {
          easing = {
            curve = "linear";
            duration-ms = 175;
          };
        };
        shaders = {
          window-open = ''
            vec4 expanding_circle(vec3 coords_geo, vec3 size_geo) {
              vec3 coords_tex = niri_geo_to_tex * coords_geo;
              vec4 color = texture2D(niri_tex, coords_tex.st);
              vec2 coords = (coords_geo.xy - vec2(0.5, 0.5)) * size_geo.xy * 2.0;
              coords = coords / length(size_geo.xy);
              float p = niri_clamped_progress;
              if (p * p <= dot(coords, coords))
              color = vec4(0.0);

              return color;
            }

            vec4 open_color(vec3 coords_geo, vec3 size_geo) {
              return expanding_circle(coords_geo, size_geo);
            }
          '';
          window-close = ''
            vec4 shrinking_circle(vec3 coords_geo, vec3 size_geo) {
              vec3 coords_tex = niri_geo_to_tex * coords_geo;
              vec4 color = texture2D(niri_tex, coords_tex.st);
              // Calculate coordinates relative to center, scaled appropriately
              vec2 coords = (coords_geo.xy - vec2(0.5, 0.5)) * size_geo.xy * 2.0;
              // Normalize coordinates based on diagonal length for a circular shape
              coords = coords / length(size_geo.xy);

              // Invert the progress for closing effect: 1 -> 0
              float p_close = 1.0 - niri_clamped_progress;

              // If pixel's squared distance from center is >= shrinking radius squared, make transparent
              // (Keeps pixels *inside* the shrinking radius p_close)
              if (p_close * p_close <= dot(coords, coords))
              color = vec4(0.0);

              // Optional: You could also fade the alpha slightly faster at the end if desired
              // color.a *= p_close; // Fades out completely as radius reaches 0

              return color;
            }

            vec4 close_color(vec3 coords_geo, vec3 size_geo) {
              return shrinking_circle(coords_geo, size_geo);
            }
          '';
        };
      };

      prefer-no-csd = true;
      hotkey-overlay.skip-at-startup = true;
    };
  };

  systemd.user.timers.niri-wallpaper = {
    Unit.Description = "Daily Wallpaper Rotation Timer";
    Timer = {
      OnCalendar = "*-*-* 00:01:00";
      Persistent = true;
    };
    Install.WantedBy = ["timers.target"];
  };
  systemd.user.services.wayland-satalite = {
    Unit = {
      Description = "Xwayland Satalite Service";
      After = "graphical-session.target";
      PartOf = "graphical-session.target";
    };
    Install.WantedBy = [ "graphical-session.target"];
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.xwayland-satellite}/bin/xwayland-satellite";
      Restart = "on-failure"; 
      Environment = [
        "WAYLAND_DISPLAY=wayland-1"
        "XDG_RUNTIME_DIR=/run/user/%U"
      ];

    };

  };
}

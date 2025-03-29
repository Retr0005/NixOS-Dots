{
  config,
  pkgs,
  inputs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
  };

  wayland.windowManager.hyprland = {
    settings = {
      "$mod" = "SUPER";

      env = [
        "XDG_CURRENT_DESKTOP, Hyprland"
        "XDG_SESSION_DESKTOP, Hyprland"
        "XDG_SESSION_TYPE, wayland"
        "GDK_BACKEND,wayland,x11,*"
        "NIXOS_OZONE_WL,1"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "MOZ_ENABLE_WAYLAND,1"
        "OZONE_PLATFORM,wayland"
        "CLUTTER_BACKEND,wayland"
        "SDL_VIDEODRIVER,wayland"
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_QPA_PLATFORMTHEME,qt6ct"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "WLR_RENDERER_ALLOW_SOFTWARE,1"
        "NIXPKGS_ALLOW_UNFREE,1"
      ];

      exec-once = [
        "swww-daemon --format xrgb &"
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &"
        "nm-applet --indicator &"
        "uwsm finalize &"
        "uwsm app vesktop &"
        "uwsm app hyprpanel &"
        "hyprctl setcursor Charlotte-Suzu 32 &"
        "wl-paste --type text --watch cliphist store &"
        "wl-paste --type image --watch cliphist store &"
        "pypr &"
      ];
      monitor = "eDP-1, highres, 0x0, 1";

      misc = {
        vrr = 0;
        disable_hyprland_logo = true;
        force_default_wallpaper = 0;
      };

      xwayland = {force_zero_scaling = true;};

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 4;
        "col.active_border" = "rgba(00000000)";
        "col.inactive_border" = "rgba(00000000)";
        resize_on_border = true;

        layout = "dwindle";
      };

      decoration = {
        rounding = 6;
        rounding_power = 4.0;
        blur = {
          enabled = "yes";
          size = 5;
          passes = 2;
          new_optimizations = "on";
          ignore_opacity = "on";
          xray = false;
          vibrancy = 0.1696;
          special = true;
        };

        dim_special = 0.1;
        shadow = {
          enabled = false;
          range = 10;
          render_power = 10;
          color = "rgba(000000FF)";
          sharp = true;
        };
      };

      render = {
        explicit_sync = 2;
        explicit_sync_kms = 2;
        direct_scanout = false;
      };

      animations = {
        first_launch_animation = true;
        enabled = true;

        bezier = [
          "wind, 0.05, 0.9, 0.1, 1.05"
          "winIn, 0.1, 1.1, 0.1, 1.1"
          "winOut, 0.3, -0.3, 0, 1"
          "liner, 1, 1, 1, 1"
        ];

        animation = [
          "windows, 1, 6, wind, slide"
          "windowsIn, 1, 6, winIn, slide"
          "windowsOut, 1, 5, winOut, slide"
          "windowsMove, 1, 5, wind, slide"
          "border, 1, 1, liner"
          "borderangle, 1, 30, linear, loop"
          "fade, 1, 10, default"
          "workspaces, 1, 5, wind"
        ];
      };

      input = {
        kb_layout = "us";
        kb_variant = "dvorak";
        repeat_rate = 50;
        repeat_delay = 200;
        touchpad = {
          tap-to-click = true;
          disable_while_typing = true;
          natural_scroll = true;
          clickfinger_behavior = false;
          drag_lock = false;
        };
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
        workspace_swipe_distance = 500;
        workspace_swipe_invert = true;
        workspace_swipe_min_speed_to_force = 30;
        workspace_swipe_cancel_ratio = 0.5;
        workspace_swipe_create_new = true;
        workspace_swipe_forever = true;
      };

      opengl = {nvidia_anti_flicker = true;};

      cursor = {
        no_hardware_cursors = true;
        enable_hyprcursor = true;
        sync_gsettings_theme = true;
        warp_on_change_workspace = true;
        no_warps = true;
      };

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
        special_scale_factor = 0.8;
      };

      master = {
        new_status = "master";
        new_on_top = 1;
        mfact = 0.5;
      };

      bind =
        [
          "$mod, A, exec, kitty"
          "$mod, return, exec, ghostty"
          "$mod, E, exec, firefox"
          "$mod, R, exec, wofi"

          "$mod, Q, killactive,"
          "$mod, O, togglefloating,"
          "$mod, F, fullscreen"
          "$mod, left, movefocus, l"
          "$mod, right, movefocus, r"
          "$mod, up, movefocus, u"
          "$mod, down, movefocus, d"

          # Scroll through workspaces with $mod + scroll
          "$mod, mouse_down, workspace, e+1"
          "$mod, mouse_up, workspace, e-1"

          "$mod, mouse:272, movewindow"
        ]
        ++ (builtins.concatLists (builtins.genList (i: let
            ws = i + 1;
          in [
            "$mod, code:1${toString i}, workspace, ${toString ws}"
            "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
          ])
          9));

      bindm = ["$mod, mouse:272, movewindow" "$mod, mouse:273, resizewindow"];

      binde = [
        ",XF86AudioRaiseVolume, exec, pamixer -i 2"
        ",XF86AudioLowerVolume, exec, pamixer -d 2"
      ];

      # Window Rules
      windowrulev2 = [
        "float, class:^([Aa]lacritty|[Kk]itty|kitty-dropterm)$"
        "opacity 0.85 0.85, class:^([Aa]lacritty|[Kk]itty|kitty-dropterm)$"
        "opacity 0.7 0.7, class:^([Ss]potify)$"
        "opacity 0.85, 0.85, class:^([Nn]eovide)"
      ];
    };
  };
}

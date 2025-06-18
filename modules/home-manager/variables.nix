{ pkgs, ... }:
{
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1"; 
    _JAVA_AWT_WM_NONEREPARENTING = "1";
    LD_LIBRARY_PATH="/nix/store/4yhzwb09jja7wfifhh0qv9d671gf0g8c-libglvnd-1.7.0/lib/";
    SSH_AUTH_SOCK = "/run/user/1000/keyring/ssh";
    DISABLE_QT5_COMPAT = "0";
    GDK_BACKEND = "wayland";
    ANKI_WAYLAND = "1";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS="@im=fcitx";
    DIRENV_LOG_FORMAT = "";
    WLR_DRM_NO_ATOMIC = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_QPA_PLATFORM = "xcb";
    #QT_QPA_PLATFORMTHEME = "qt6ct";
    MOZ_ENABLE_WAYLAND = "1";  
    WLR_NO_HARDWARE_CURSORS = "1";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland"; 
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
  };
}

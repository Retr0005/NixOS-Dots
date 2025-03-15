{
    pkgs,
    ...
}: 
{
    programs.kitty = {
        enable = true;
        package = pkgs.kitty;

        settings = {
            font_size = 12;
            wheel_scroll_min_lines = 1;
            window_padding_width = 10;
            confirm_os_window_close = 0;
            scrollback_lines = 10000;
            enable_audio_bell = false;
            mouse_hide_wait = 60;
        };
    };
}

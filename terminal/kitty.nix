{pkgs, ...}: {
  home.packages = [ pkgs.kitty ];
  home.file.".config/kitty/kitty.conf".text = ''
    window_padding_width 5
    hide_window_decorations yes
    background_opacity 0.9
    font_family JetBrains Mono
    font_size 12.0
    remember_window_size no
    confirm_os_window_close 0
    shell fish
    cursor_trail 1
    cursor_shape block
    shell_integration no-cursor

    # --- Noctalia Theme ---
    color0 #474551
    color1 #ffb4ab
    color2 #c4c0ff
    color3 #c6c3e9
    color4 #feacef
    color5 #c4c0ff
    color6 #c6c3e9
    color7 #e5e1e9
    color8 #928f9c
    color9 #ffb4ab
    color10 #c4c0ff
    color11 #c6c3e9
    color12 #feacef
    color13 #c4c0ff
    color14 #c6c3e9
    color15 #e5e1e9

    cursor                #e5e1e9
    cursor_text_color     #131318
    background            #131318
    foreground            #e5e1e9
    selection_foreground  #c8c5d2
    selection_background  #474551
    active_border_color   #c4c0ff
    inactive_border_color #474551
    url_color             #c4c0ff

    active_tab_foreground   #292473
    active_tab_background   #c4c0ff
    inactive_tab_foreground #c8c5d2
    inactive_tab_background #474551
    cursor_trail_color      #c8c5d2

    # Windows-like shortcuts
    # Copy: if there is a selection, copy it; otherwise, send Ctrl+C to interrupt
    map ctrl+c copy_or_interrupt

    # Paste from clipboard
    map ctrl+v paste_from_clipboard

    # Fast word deletion (Windows-style)
    map ctrl+backspace send_text all \x17
    map ctrl+delete send_text all \x1bd

    # Select All (Copy entire scrollback to clipboard)
    map ctrl+a pipe @text clipboard sh -c "wl-copy 2>/dev/null || xclip -selection clipboard"

    # Font size adjustments (Windows/Browser style)
    map ctrl+equal change_font_size all +1.0
    map ctrl+minus change_font_size all -1.0
    map ctrl+0 change_font_size all 0

    # Mouse wheel font size adjustment (Ctrl + Scroll)
    mouse_map ctrl+scroll_up change_font_size all +1.0
    mouse_map ctrl+scroll_down change_font_size all -1.0
  '';
}

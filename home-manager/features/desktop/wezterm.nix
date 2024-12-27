{inputs, ...}: {
  programs.wezterm = {
    enable = true;
    package = inputs.wezterm.packages.x86_64-linux.default;
    extraConfig = ''
      return {
        font_size = 12.0 ,
        font = wezterm.font_with_fallback {
          'IntoneMono Nerd Font',
        },
        -- front_end = "WebGpu",
        color_scheme = 'Dracula (Official)',
        warn_about_missing_glyphs = false,
        animation_fps = 30,
        enable_kitty_graphics = true,
        enable_wayland = true,
        default_cursor_style = "BlinkingUnderline",
        window_background_opacity = 0.75,
        hide_tab_bar_if_only_one_tab = true,
        tab_bar_at_bottom = true,
        use_fancy_tab_bar = true,
        show_tab_index_in_tab_bar = false,
       }
    '';
  };
}

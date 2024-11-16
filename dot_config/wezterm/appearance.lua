local wezterm = require "wezterm";
local module = {};
local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle
local background_image = wezterm.config_dir .. "\\wezterm-wallpaper.jpg" or "./wezterm-wallpaper.jpg"


function module.apply_config(config)
    config.font = wezterm.font("Hack Nerd Font");
    config.font_size = 12.0;
    config.command_palette_font_size = 14.0;
    config.macos_window_background_blur = 20;
    config.command_palette_bg_color = '#4D07FF';
    config.color_scheme = 'Catppuccin Mocha';

    config.background = {
        {
            source = {
            Gradient = {
            colors = { "#124354", "#001522" }, -- グラデーションのカラーセット
            orientation = { Linear = { angle = -30.0 } }}},
            opacity = 0.8, -- 透明度
            width = "100%", -- 幅
            height = "100%", -- 高さ
        },
        {
            source = { File = background_image },
            opacity = 0.3,
        },
    }

    config.colors = {
        tab_bar = {
            inactive_tab_edge = "none",
        },
    };

    config.show_close_tab_button_in_tabs = false;

    -- change the shape of tabs
    -- colorrize active
    wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
        local background = "#5c6d74"
        local foreground = "#FFFFFF"
        local edge_background = "none"

        if tab.is_active then
            background = "#3fafff"
            foreground = "#FFFFFF"
        end

        local edge_foreground = background

        local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "

        return {
            { Background = { Color = edge_background } },
            { Foreground = { Color = edge_foreground } },
            { Text = SOLID_LEFT_ARROW },
            { Background = { Color = background } },
            { Foreground = { Color = foreground } },
            { Text = title },
            { Background = { Color = edge_background } },
            { Foreground = { Color = edge_foreground } },
            { Text = SOLID_RIGHT_ARROW },
        }
    end);

end

return module;

local wezterm = require "wezterm";
local module = {};

function module.apply_config(config)
    config.automatically_reload_config = true;
    config.use_ime = true; -- Needed for using IME
    config.macos_forward_to_ime_modifier_mask = "SHIFT|CTRL"; -- Needed for using Ctrl on macOS
    config.scrollback_lines = 3500;
    config.enable_scroll_bar = true;
    config.window_decorations = "RESIZE"; -- Remove title bar
    config.hide_tab_bar_if_only_one_tab = true;
    config.switch_to_last_active_tab_when_closing_tab = true;
    quit_when_all_windows_are_closed = false;

    if wezterm.target_triple == "x86_64-pc-windows-msvc" then
        config.default_prog = {
            "C:\\Program Files\\PowerShell\\7-preview\\pwsh.exe",
        };
    elseif wezterm.target_triple == "x86_64-apple-darwin" or wezterm.target_triple == "x86_64-unknown-linux-gnu" then
        config.default_prog = {
            "/usr/bin/zsh",
        };
    end
end

return module;
local wezterm = require "wezterm";
local module = {};

module.keys = {
    { key = "a", mods = "ALT", action = wezterm.action{ActivateTabRelative=-1} },
    { key = "d", mods = "ALT", action = wezterm.action{ActivateTabRelative=1} },
    { key = "w", mods = "CTRL|SHIFT", action = wezterm.action{CloseCurrentPane={confirm=true}} },
    { key = "d", mods = "CTRL|SHIFT", action = wezterm.action.SplitHorizontal{domain="CurrentPaneDomain"} },
    { key = "r", mods = "CTRL|SHIFT", action = wezterm.action.SplitVertical{domain="CurrentPaneDomain"} },
    { key = "Backspace", mods = "CTRL|SHIFT", action = wezterm.action.SendKey{ key = "w", mods = "CTRL" }},
};

return module;
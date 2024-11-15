local wezterm = require "wezterm";
local general = require "general";
local appearance = require "appearance";
local keybinds = require "keybinds";

local config = wezterm.config_builder();

-- general
general.apply_config(config);

-- appearance
appearance.apply_config(config);

-- keybinds
config.keys = keybinds.keys;
config.key_tables = keybinds.key_tables;

return config;
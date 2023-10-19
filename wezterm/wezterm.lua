-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'OneDark (base16)'
config.font = wezterm.font 'CaskaydiaCove Nerd Font'
config.font_size = 21
config.window_background_opacity = 0.75
config.macos_window_background_blur = 25
config.window_decorations = "RESIZE"
config.initial_rows = 70
config.initial_cols = 140
config.window_padding = {
    left = 2,
    right = 0,
    top = 0,
    bottom = 0,
}




-- and finally, return the configuration to wezterm
return config

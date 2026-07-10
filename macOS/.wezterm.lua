
local wezterm = require 'wezterm'
local config = wezterm.config_builder()


config.font_size = 16
config.initial_cols = 120
config.initial_rows = 28
config.font = wezterm.font('JetBrains Mono')
config.color_scheme = 'Night Owl (Gogh)'

return config

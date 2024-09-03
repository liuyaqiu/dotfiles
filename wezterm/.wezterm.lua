-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'AdventureTime'

local act = wezterm.action

config.keys = {
  -- paste from the clipboard
  { key = 'V', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },

  -- paste from the primary selection
  -- { key = 'v', mods = 'CTRL', action = act.PasteFrom 'PrimarySelection' },

  -- copy from clipboard and primary selection
  { key = 'C', mods = 'CTRL', action = wezterm.action.CopyTo 'ClipboardAndPrimarySelection' },
}

-- font
config.font = wezterm.font {
    family = 'Fira Code Medium',
    harfbuzz_features = {"ss02", "ss03", "ss04", "ss05", "ss08"},
}

config.font_size = 16.0


-- and finally, return the configuration to wezterm
return config

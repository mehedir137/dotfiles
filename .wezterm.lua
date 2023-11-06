local wezterm = require('wezterm')
local mux = wezterm.mux

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

wezterm.on("mux-startup", function()
  local tab, pane, window = mux.spawn_window{}
  window:gui_window():maximize()
end)

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'Neon (terminal.sexy)'
config.window_background_opacity = 0.3
config.text_background_opacity = 0.6
-- config.font = wezterm.font('JetBrains Mono')

config.enable_wayland = true
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.font_size = 15
config.cursor_blink_rate = 800

-- config.colors = {
--   foreground = 'silver',
--   background = '#161616',
-- }

config.keys = {
  { key = 'n', mods = 'SHIFT|CTRL', action = wezterm.action.SpawnWindow },
}


return config


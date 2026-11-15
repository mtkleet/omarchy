-- Personal keybindings.
-- Omarchy defaults remain enabled; conflicting bindings are replaced
-- using o.rebind().

------------------
-- APPLICATIONS
------------------

o.rebind("SUPER + RETURN", "Open terminal", { launch = "alacritty" })

o.bind("SUPER + D", "Application launcher", { launch = "rofi -show drun" })
o.bind("SUPER + R", "Application launcher", { launch = "rofi -show drun" })
o.rebind("SUPER + T", "Window switcher", { launch = "rofi -show window" })

o.rebind("SUPER + W", "Open Firefox", { launch = "firefox" })
o.bind("SUPER + N", "Open file manager", { launch = "thunar" })

o.rebind("SUPER + SHIFT + E", "Power menu", {
  launch = "omarchy-hyprland-powermenu",
})

o.rebind("SUPER + P", "Switch audio output", "omarchy-audio-device-switch")

------------------
-- WINDOW ACTIONS
------------------

-- SUPER + Q is already assigned by Omarchy to close the active window.

o.rebind("SUPER + C", "Close window", hl.dsp.window.close())

o.rebind("SUPER + F", "Toggle fullscreen", hl.dsp.window.fullscreen({ action = "toggle" }))

o.rebind("SUPER + SHIFT + SPACE", "Toggle floating", hl.dsp.window.float({ action = "toggle" }))

o.rebind("SUPER + SHIFT + C", "Reload configuration", hl.dsp.reload_config())

o.rebind("SUPER + L", "Lock screen", "hyprlock")

-- UWSM-safe logout.
o.rebind("SUPER + M", "Log out", "uwsm stop")

------------------
-- FOCUS DIRECTION
------------------

-- Omarchy already provides SUPER + arrow keys for focus navigation.

------------------
-- WINDOW MOVEMENT
------------------

-- Replace Omarchy's default window swapping with i3-style movement.

local directions = {
  { key = "LEFT",  direction = "left" },
  { key = "DOWN",  direction = "down" },
  { key = "UP",    direction = "up" },
  { key = "RIGHT", direction = "right" },
}

for _, item in ipairs(directions) do
  o.rebind(
    "SUPER + SHIFT + " .. item.key,
    "Move window " .. item.direction,
    hl.dsp.window.move({ direction = item.direction })
  )
end

------------------
-- DWINDLE LAYOUT
------------------

o.bind("SUPER + H", "Split left", hl.dsp.layout("preselect l"))

o.rebind("SUPER + V", "Split down", hl.dsp.layout("preselect d"))

o.bind("SUPER + E", "Toggle split", hl.dsp.layout("togglesplit"))

------------------
-- WORKSPACE CYCLING
------------------

-- Omarchy's workspace number bindings (SUPER + 1..0)
-- and window-to-workspace bindings remain enabled.

o.rebind("SUPER + TAB", "Next workspace", hl.dsp.focus({ workspace = "e+1" }))

o.rebind("SUPER + SHIFT + TAB", "Previous workspace", hl.dsp.focus({ workspace = "e-1" }))

------------------
-- SCRATCHPAD
------------------

o.rebind("SUPER + S", "Toggle scratchpad", hl.dsp.workspace.toggle_special("magic"))

o.rebind("SUPER + SHIFT + S", "Move window to scratchpad", hl.dsp.window.move({ workspace = "special:magic" }))

------------------
-- MOUSE
------------------

-- Omarchy's SUPER + left/right mouse buttons remain enabled.

o.rebind("SUPER + mouse_down", "Next workspace", hl.dsp.focus({ workspace = "e+1" }))

o.rebind("SUPER + mouse_up", "Previous workspace", hl.dsp.focus({ workspace = "e-1" }))

------------------
-- AUDIO
------------------

o.rebind(
  "XF86AudioRaiseVolume",
  "Volume up",
  "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+",
  { locked = true, repeating = true }
)

o.rebind(
  "XF86AudioLowerVolume",
  "Volume down",
  "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-",
  { locked = true, repeating = true }
)

o.rebind("XF86AudioMute", "Mute audio", "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle", { locked = true })

o.rebind("XF86AudioMicMute", "Mute microphone", "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle", { locked = true })

------------------
-- MEDIA
------------------

o.rebind("XF86AudioPlay", "Play / pause", "omarchy-player-control toggle", { locked = true })

o.rebind("XF86AudioPause", "Play / pause", "omarchy-player-control toggle", { locked = true })

o.rebind("XF86AudioNext", "Next track", "omarchy-player-control next", { locked = true })

o.rebind("XF86AudioPrev", "Previous track", "omarchy-player-control prev", { locked = true })

o.rebind("XF86AudioStop", "Stop playback", "omarchy-player-control stop", { locked = true })

------------------
-- BRIGHTNESS
------------------

o.rebind("XF86MonBrightnessUp", "Brightness up", "brightnessctl -e4 -n2 set 5%+", { locked = true, repeating = true })

o.rebind(
  "XF86MonBrightnessDown",
  "Brightness down",
  "brightnessctl -e4 -n2 set 5%-",
  { locked = true, repeating = true }
)

------------------
-- SCREENSHOT
------------------

o.rebind(
  "PRINT",
  "Screenshot",
  'mkdir -p "$HOME/.local/omarchyshell/Pictures/Screenshots" && grim "$HOME/.local/omarchyshell/Pictures/Screenshots/$(date +%F_%H-%M-%S).png"'
)

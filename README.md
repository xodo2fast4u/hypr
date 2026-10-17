<h1 align="center">Hyprland config</h1>

<p align="center">
  A personal, modular Hyprland setup with Lua-based configuration, keyboard-driven window management and a few desktop tools started on login.
</p>

> [!NOTE]
> This is a personal configuration, not a ready-made installer. Review the app commands, monitor settings and file paths below and make them your own before using it.

## What's included

- Hyprland settings split into Lua modules instead of one large file.
- Dwindle layout, animations, blur, rounded corners and window/layer rules.
- Workspace navigation, window movement and resizing, screenshots and media keys.
- Startup commands for Waybar, Hyprpaper, CopyQ and GNOME Keyring.
- Three-finger gestures for workspace switching, fullscreen and floating windows.

## Requirements

These files use the Lua `hl` configuration API. They need a Hyprland setup or configuration loader that provides that API and loads `hyprland.lua`; they are not a standalone `hyprland.conf`.

The configured commands and desktop tools include:

| Command or app         | Used for                                                             |
| ---------------------- | -------------------------------------------------------------------- |
| `kitty`                | Terminal (`Super+Q`)                                                 |
| `thunar`               | File manager (`Super+E`)                                             |
| `wofi`                 | Application launcher (`Super+R`)                                     |
| `waybar`               | Status bar, started at login                                         |
| `hyprpaper`            | Wallpaper, started at login                                          |
| `copyq`                | Clipboard history, started at login and toggled with `Super+Shift+V` |
| `gnome-keyring-daemon` | Keyring secrets, started at login                                    |
| `grimblast` and `grim` | Screenshots (`Super+Z` and `Super+Shift+Z`)                          |
| `wpctl`                | Volume and microphone media keys                                     |
| `brightnessctl`        | Brightness media keys                                                |
| `playerctl`            | Play/pause and track navigation media keys                           |

Install the tools for the features you use with your distribution's package manager. `playerctl` is only needed for the media playback keys; the other listed tools are required by the configured apps or bindings.

## Install

Back up any existing `~/.config/hypr` before replacing it. Then clone this repository there:

```sh
git clone https://github.com/xodo2fast4u/hypr.git ~/.config/hypr
```

Configure your Lua-capable Hyprland setup to load `~/.config/hypr/hyprland.lua`. Review the machine-specific settings below before starting or reloading Hyprland.

## Personalize before use

This setup contains a few values tied to one machine:

- **Monitor:** [monitors.lua](./monitors.lua) sets `HDMI-A-1` to `1366x768@60`, then applies an automatic preferred mode to other outputs. Change this to match your displays.
- **Wallpaper:** [hyprpaper.conf](./hyprpaper.conf) uses `/home/xodobyte/Pictures/wall.png` for `HDMI-A-1`. Set a wallpaper path that exists on your system and update the monitor name if needed.
- **Autostart:** [autostart.lua](./autostart.lua) launches Waybar, Hyprpaper, CopyQ and GNOME Keyring when Hyprland starts. Remove or replace commands for apps you do not use.
- **Default apps:** [programs.lua](./programs.lua) sets the terminal, file manager and launcher commands. Change these to installed alternatives.
- **Screenshot path:** [keybindings.lua](./keybindings.lua) saves screenshots under `~/Pictures/Screenshots`; create that directory or change the destination.
- **Clipboard app path:** The clipboard toggle binding uses `/usr/bin/copyq`. Update it if CopyQ is installed elsewhere or you use another clipboard manager.
- **Input:** [input.lua](./input.lua) uses a US keyboard layout and configures touchpad behavior and gestures. Adjust it for your keyboard and device.

## Keybindings

The main modifier is **Super** (usually the Windows key).

| Binding                                  | Action                                              |
| ---------------------------------------- | --------------------------------------------------- |
| `Super+Q`                                | Open terminal                                       |
| `Super+E`                                | Open file manager                                   |
| `Super+R`                                | Open application launcher                           |
| `Super+C`                                | Close active window                                 |
| `Super+V`                                | Toggle floating for active window                   |
| `Super+F`                                | Toggle fullscreen                                   |
| `Super+1`-`Super+0`                      | Switch to workspaces 1-10                           |
| `Super+Shift+1`-`Super+Shift+0`          | Move active window to workspaces 1-10               |
| `Super+Arrow`                            | Move focus between windows                          |
| `Super+Shift+Arrow`                      | Resize active window                                |
| `Super+Alt+Arrow`                        | Swap active window with a neighbor                  |
| `Super+Z`                                | Capture screen                                      |
| `Super+Shift+Z`                          | Capture selected area                               |
| `Super+S`                                | Toggle the `magic` special workspace                |
| `Super+Shift+S`                          | Move active window to the `magic` special workspace |
| `Super+Shift+V`                          | Toggle clipboard history                            |
| `Super+Left-click` / `Super+Right-click` | Drag / resize a window                              |

The volume, microphone, brightness and media playback keys are also bound where supported by the keyboard.

## File layout

| File                                 | Purpose                                                  |
| ------------------------------------ | -------------------------------------------------------- |
| [hyprland.lua](./hyprland.lua)       | Loads the configuration modules                          |
| [programs.lua](./programs.lua)       | Default terminal, file manager and launcher              |
| [autostart.lua](./autostart.lua)     | Apps launched when Hyprland starts                       |
| [monitors.lua](./monitors.lua)       | Display mode and placement                               |
| [env.lua](./env.lua)                 | Cursor environment variables                             |
| [look.lua](./look.lua)               | Gaps, layout, decoration, animations and workspace rules |
| [input.lua](./input.lua)             | Keyboard, touchpad and gestures                          |
| [keybindings.lua](./keybindings.lua) | Keyboard and mouse bindings                              |
| [rules.lua](./rules.lua)             | Window and layer rules                                   |
| [permissions.lua](./permissions.lua) | Hyprland permission settings                             |
| [misc.lua](./misc.lua)               | General Hyprland behavior                                |
| [hyprpaper.conf](./hyprpaper.conf)   | Wallpaper configuration                                  |

## License

MIT LICENSE.
<h1 align="center">Hypr</h1>

<p align="center">
  A personal, modular Hyprland setup using Lua configuration, keyboard-driven window management and a small set of desktop tools started on login.
</p>

<p align="center">
  <a href="https://deepwiki.com/xodo2fast4u/hypr">
    <img src="https://img.shields.io/badge/DeepWiki-Ask%20DeepWiki-0078D4?style=for-the-badge" alt="Ask DeepWiki" />
  </a>
  <a href="https://github.com/xodo2fast4u/hypr/blob/master/LICENSE">
    <img src="https://img.shields.io/badge/license-MIT-2E8B57?style=for-the-badge" alt="License: MIT" />
  </a>
  <a href="https://hypr.land/">
    <img src="https://img.shields.io/badge/Hyprland-0.55%2B-00D4FF?style=for-the-badge" alt="Hyprland 0.55+" />
  </a>
  <a href="https://github.com/GIScience/badges#active">
    <img src="https://img.shields.io/badge/status-active-2ECC71?style=for-the-badge" alt="Status: active" />
  </a>
</p>

Hypr is a self-hosted Hyprland rice split into Lua modules instead of one large config file. It handles window management, workspaces, screenshots, media keys and login autostart in one place, so the desktop stays keyboard-driven and easy to extend.

> [!NOTE]
> This is a personal configuration, not a ready-made installer. Review the app commands, monitor settings and file paths below and make them your own before using it.

## Disclaimer

**IMPORTANT**: Hypr is provided for educational and personal use. Please ensure you:

- **Review before applying**: Do not copy this rice blindly onto another machine
- **Replace personal paths**: Wallpaper, screenshot and helper-script paths in this repo belong to one setup
- **Check permissions**: Screencopy and plugin permissions are locked down; binaries that do not match the allow list will be blocked or prompted
- **Legal compliance**: Ensure your use of screenshots, recording tools and third-party software complies with local laws and the terms of those tools

The maintainer is not responsible for a broken session, missing keybinds or data loss from replacing an existing `~/.config/hypr` without a backup. Users are solely responsible for backing up their current config and adapting this one to their hardware.

> [!CAUTION]
> Replacing `~/.config/hypr` while Hyprland is running can leave you without binds or autostart until you restore a working config. Keep a backup and a TTY login available.

## Why Hypr?

Hypr combines several pieces of a daily Hyprland session into one modular config:

- Window management with dwindle layout, smart gaps, blur, rounding and animations
- Workspace, scratchpad, focus, swap and resize bindings on Super
- Desktop utilities such as Waybar, Hyprpaper, CopyQ, Dunst, screenshots and media keys
- A Lua module layout that makes it straightforward to change one area without editing everything else

## Features

### Look and layout

- **Dwindle layout**: Split-preserving tiled windows
- **Smart gaps**: No inner or outer gaps when a single tiled window is on screen
- **Borderless windows**: Transparent borders with rounded corners
- **Blur and shadows**: Blur on decorations and layers, shadows on floating windows
- **Inactive opacity**: Unfocused windows fade to 75% opacity
- **Animations**: Bezier and spring curves for windows, layers, workspaces and fades

### Session tools

- **Autostart**: Waybar, Hyprpaper, CopyQ and Dunst on Hyprland start
- **Launcher and terminal**: Wofi (`Super+R`) and Kitty (`Super+Q`)
- **Screenshots**: Full screen with Grim, region with Grim + Slurp
- **Clipboard history**: CopyQ toggled with `Super+Shift+V`
- **Theme helper**: `Super+L` runs `~/.local/bin/toggle-theme.sh` when that script exists
- **Media keys**: Volume, mic mute, brightness and playerctl playback

### Input and rules

- **US keyboard** with follow-mouse focus
- **Touchpad**: tap-to-click and disable-while-typing
- **Gestures**: three-finger swipe for workspaces, fullscreen and floating
- **Window rules**: floating pickers, pinned picture-in-picture, Wofi and notification blur
- **Permissions**: screencopy allowed for Grim and the Hyprland portal; `wl-screenrec` asks first

## Prerequisites

Hyprland **0.55+** is required. From 0.55 onward Hyprland uses Lua (`hyprland.lua`) and the older hyprlang `hyprland.conf` syntax is deprecated. See the [Hyprland wiki](https://wiki.hypr.land/configuring/core/) for how `~/.config/hypr/hyprland.lua` is loaded.

These files use the Lua `hl` configuration API. They are not a standalone `hyprland.conf`.

### Linux

Install Hyprland and the tools this rice calls, using your distribution's package manager. Arch Linux examples:

```bash
sudo pacman -S hyprland kitty thunar wofi waybar hyprpaper copyq dunst grim slurp brightnessctl playerctl
```

Volume keys use `~/.local/bin/volume.sh`. Mic mute uses `wpctl` (PipeWire / WirePlumber). Brightness keys use `brightnessctl`. Playback keys use `playerctl`.

Create the screenshot directory used by the binds:

```bash
mkdir -p ~/Pictures/Screenshots
```

**Verify installation:**

```bash
hyprctl version
```

```bash
kitty --version
```

```bash
git --version
```

Once Hyprland and Git are installed, clone this repository and follow the steps below.

## Quick Start

### 1. Back up any existing config

```bash
mv ~/.config/hypr ~/.config/hypr.bak
```

### 2. Clone the repository

```bash
git clone https://github.com/xodo2fast4u/hypr.git ~/.config/hypr
```

```bash
cd ~/.config/hypr
```

### 3. Personalize machine-specific files

Edit at least [monitors.lua](./monitors.lua), [hyprpaper.conf](./hyprpaper.conf) and [programs.lua](./programs.lua). See [Personalize before use](#personalize-before-use).

### 4. Reload Hyprland

Hyprland reloads when config files change. To reload manually:

```bash
hyprctl reload
```

If you are not already in a Hyprland session, start one from your display manager or from a TTY with `Hyprland` / `start-hyprland`.

## Personalize before use

This setup contains values tied to one machine:

- **Monitor:** [monitors.lua](./monitors.lua) sets `HDMI-A-1` to `1366x768@60`, then applies an automatic preferred mode to other outputs. Change this to match your displays.
- **Wallpaper:** [hyprpaper.conf](./hyprpaper.conf) uses `/home/xodobyte/Pictures/wallpaper.png` for `HDMI-A-1`. Set a wallpaper path that exists on your system and update the monitor name if needed.
- **Autostart:** [autostart.lua](./autostart.lua) launches Waybar, Hyprpaper, CopyQ and Dunst when Hyprland starts. Remove or replace commands for apps you do not use.
- **Default apps:** [programs.lua](./programs.lua) sets the terminal, file manager and launcher commands.
- **Screenshot path:** [keybindings.lua](./keybindings.lua) saves screenshots under `~/Pictures/Screenshots`.
- **Clipboard app path:** The clipboard toggle uses `/usr/bin/copyq`. Update it if CopyQ is installed elsewhere.
- **Helper scripts:** `Super+L` runs `~/.local/bin/toggle-theme.sh`. Volume keys run `~/.local/bin/volume.sh`. `Super+M` prefers `hyprshutdown` and falls back to exiting Hyprland. Those helpers are not in this repo.
- **Input:** [input.lua](./input.lua) uses a US keyboard layout plus touchpad and gesture settings.
- **Cursors:** [env.lua](./env.lua) sets `Adwaita` for `XCURSOR` and `HYPRCURSOR`.

## Configuration

Hyprland reads `~/.config/hypr/hyprland.lua`, which `require`s the modules in this directory. Wallpaper is separate: Hyprpaper reads [hyprpaper.conf](./hyprpaper.conf).

| File / setting                         | Description                                      | Default in this rice                          |
| -------------------------------------- | ------------------------------------------------ | --------------------------------------------- |
| [programs.lua](./programs.lua)         | Terminal, file manager, launcher                 | `kitty`, `thunar`, `wofi --show drun`         |
| [monitors.lua](./monitors.lua)         | Output name, mode, position, scale               | `HDMI-A-1` at `1366x768@60`                   |
| [look.lua](./look.lua) `layout`        | Tiling layout                                    | `dwindle`                                     |
| [look.lua](./look.lua) `gaps_in` / `gaps_out` | Inner / outer gaps                         | `3` / `15` (zero on a single tiled window)    |
| [look.lua](./look.lua) `rounding`      | Corner radius                                    | `10`                                          |
| [env.lua](./env.lua)                   | Cursor theme and size                            | Adwaita, size `24`                            |
| [input.lua](./input.lua) `kb_layout`   | Keyboard layout                                  | `us`                                          |
| [keybindings.lua](./keybindings.lua)   | Main modifier                                    | `SUPER`                                       |

Config is reloaded when files change. Some environment variables and autostart processes only apply on a new Hyprland session.

## Project structure

The main config is [hyprland.lua](./hyprland.lua). Modules are organized like this:

| Path                                 | Purpose                                                  |
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
| [permissions.lua](./permissions.lua) | Screencopy, plugin and cursor permission policy          |
| [misc.lua](./misc.lua)               | Wallpaper splash and logo behaviour                      |
| [hyprpaper.conf](./hyprpaper.conf)   | Wallpaper configuration for Hyprpaper                    |

Lua editor stubs for the `hl` API ship with Hyprland under `/usr/share/hypr/stubs/` (NixOS: `/run/current-system/sw/share/hypr/stubs/`). Point your Lua language server at that directory for completion.

## Keybinding overview

The main modifier is **Super** (usually the Windows key).

### Windows and apps

| Binding                         | Action                                              |
| ------------------------------- | --------------------------------------------------- |
| `Super+Q`                       | Open terminal                                       |
| `Super+E`                       | Open file manager                                   |
| `Super+R`                       | Open application launcher                           |
| `Escape`                        | Close Wofi                                          |
| `Super+C`                       | Close active window                                 |
| `Super+V`                       | Toggle floating for active window                   |
| `Super+F`                       | Toggle fullscreen                                   |
| `Super+P`                       | Toggle pseudotile                                   |
| `Super+J`                       | Toggle dwindle split                                |
| `Super+M`                       | Exit session (`hyprshutdown` if installed)          |
| `Super+L`                       | Run `~/.local/bin/toggle-theme.sh`                  |
| `Super+Shift+V`                 | Toggle CopyQ                                        |
| `Super+Z`                       | Capture the full screen                             |
| `Super+Shift+Z`                 | Capture a selected region                           |

### Workspaces and movement

| Binding                                  | Action                                              |
| ---------------------------------------- | --------------------------------------------------- |
| `Super+1`–`Super+0`                      | Switch to workspaces 1–10                           |
| `Super+Shift+1`–`Super+Shift+0`          | Move active window to workspaces 1–10               |
| `Super+Arrow`                            | Move focus between windows                          |
| `Super+Shift+Arrow`                      | Resize active window                                |
| `Super+Alt+Arrow`                        | Swap active window with a neighbor                  |
| `Super+S`                                | Toggle the `magic` special workspace                |
| `Super+Shift+S`                          | Move active window to the `magic` special workspace |
| `Super+Scroll`                           | Cycle through existing workspaces                   |
| `Super+Left-click` / `Super+Right-click` | Drag / resize a window                              |

### Hardware keys

| Binding                                         | Action                                      |
| ----------------------------------------------- | ------------------------------------------- |
| `XF86AudioRaiseVolume` / `XF86AudioLowerVolume` | Volume up / down via `volume.sh`            |
| `XF86AudioMute`                                 | Mute via `volume.sh`                        |
| `XF86AudioMicMute`                              | Toggle default source mute with `wpctl`     |
| `XF86MonBrightnessUp` / `XF86MonBrightnessDown` | Brightness via `brightnessctl`              |
| `XF86AudioPlay` / `XF86AudioPause`              | Play/pause via `playerctl`                  |
| `XF86AudioNext` / `XF86AudioPrev`               | Next / previous track via `playerctl`       |

Volume, brightness and playback binds use `locked = true` so they still work on the lock screen.

### Touchpad gestures

| Gesture                    | Action              |
| -------------------------- | ------------------- |
| Three-finger horizontal    | Switch workspace    |
| Three-finger swipe up      | Toggle fullscreen   |
| Three-finger swipe down    | Toggle floating     |

## Window and layer rules

[rules.lua](./rules.lua) applies the following behaviour:

- Maximize events are suppressed on all windows
- Empty-class XWayland drag surfaces do not steal focus
- `hyprland-run` is floated near the bottom of the monitor
- Wofi and notification layers are blurred
- `pavucontrol`, Blueman, file pickers and Picture-in-Picture are floated (PiP is also pinned)
- Tiled windows do not draw shadows

## Permissions

[permissions.lua](./permissions.lua) sets `ecosystem.enforce_permissions = true`.

| Binary pattern                                              | Type        | Mode    |
| ----------------------------------------------------------- | ----------- | ------- |
| `/usr/(bin\|local/bin)/grim`                                | screencopy  | allow   |
| `/usr/(lib\|libexec\|lib64)/xdg-desktop-portal-hyprland`    | screencopy  | allow   |
| `/usr/(bin\|local/bin)/hyprpm`                              | plugin      | allow   |
| `/usr/(bin\|local/bin)/wl-screenrec`                        | screencopy  | ask     |
| `.*`                                                        | cursorpos   | allow   |

If a screenshot or portal tool lives somewhere else, add a matching `hl.permission` entry or screenshots will fail.

## Development

### Adding a module

1. Create a Lua file next to [hyprland.lua](./hyprland.lua), for example `look.lua` or `keybindings.lua`.
2. Export nothing unless another file needs `require` return values. [programs.lua](./programs.lua) is the exception: it returns a table of app commands.
3. Load the file from [hyprland.lua](./hyprland.lua) with `require("modulename")`.

Hyprland treats each `require` as a separate Lua scope, so an error in one module does not stop the others. A missing module name still fails the file that required it.

### Reloading

Save a file under `~/.config/hypr` and Hyprland reloads it. To force a reload:

```bash
hyprctl reload
```

Use `hyprctl clients` and `hyprctl activewindow` when writing window rules, so class and title matchers are exact.

## Security & Privacy

- **Permission enforcement**: Screencopy is not open to every binary
- **Ask for recording**: `wl-screenrec` must be confirmed
- **Plugin allow list**: `hyprpm` is explicitly allowed; other plugin loaders are not
- **Personal paths**: Wallpaper and home-directory paths in this repo should be replaced before sharing a copy of the config

> [!IMPORTANT]
>
> 1. **Wayland session**: This config is for Hyprland on Wayland, not X11
> 2. **Portal**: Screen sharing needs `xdg-desktop-portal-hyprland`
> 3. **Helper scripts**: Theme and volume scripts live outside this repository
> 4. **Screenshots**: Grim writes under `~/Pictures/Screenshots`
> 5. **Permissions**: Tools installed outside `/usr/bin` or `/usr/local/bin` need new permission rules

## Troubleshooting

### Common issues

**Hyprland ignores this config**

- Confirm you are on Hyprland 0.55+ (`hyprctl version`)
- Confirm the files live in `~/.config/hypr` and the entry file is `hyprland.lua`
- Run `hyprctl reload` and check Hyprland logs

**No wallpaper**

- Hyprpaper must be running (started from [autostart.lua](./autostart.lua))
- Update the monitor name and image path in [hyprpaper.conf](./hyprpaper.conf)
- Confirm the image file exists

**Screenshots do nothing**

- Install `grim` and `slurp`
- Create `~/Pictures/Screenshots`
- Check [permissions.lua](./permissions.lua) if Grim is not under `/usr/bin` or `/usr/local/bin`

**Volume or brightness keys do nothing**

- Volume expects `~/.local/bin/volume.sh`
- Brightness expects `brightnessctl`
- Mic mute expects `wpctl`

**Wrong monitor layout**

- Replace `HDMI-A-1` and `1366x768@60` in [monitors.lua](./monitors.lua)
- List outputs with `hyprctl monitors`

**Launcher or bar missing**

- Install `wofi` and `waybar`
- `Escape` closes Wofi; `Super+R` opens it

## Contributing

This is a personal rice but fixes and cleanups are welcome.

1. Fork the repository
2. Create a feature branch:

   ```bash
   git checkout -b feature/your-change
   ```

3. Keep machine-specific paths out of shared defaults when possible
4. Test by reloading Hyprland (`hyprctl reload`) and exercising the changed binds or rules
5. Submit a pull request

## Support

For issues, questions or contributions:

- Create an issue in the [repository](https://github.com/xodo2fast4u/hypr)
- Read the [Hyprland wiki](https://wiki.hypr.land/configuring/core/)
- Ask on [DeepWiki](https://deepwiki.com/xodo2fast4u/hypr)

## License

This project is under the [MIT License](./LICENSE)

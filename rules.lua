hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

hl.layer_rule({
    name  = "wofi-blur",
    match = { namespace = "wofi" },
    blur  = true,
})

hl.window_rule({
    name  = "float-pavucontrol",
    match = { class = "^(org.pulseaudio.pavucontrol|pavucontrol)$" },
    float = true,
    size  = "800 600",
    center = true,
})

hl.window_rule({
    name  = "float-blueman",
    match = { class = "^(blueman-manager)$" },
    float = true,
    center = true,
})

hl.window_rule({
    name  = "float-file-picker",
    match = { title = "^(Open File|Select a File|Choose wallpaper|Open Folder|Save As|Library)$" },
    float = true,
    center = true,
})

hl.window_rule({
    name  = "no-shadow-tiled",
    match = { float = false },
    no_shadow = true,
})

hl.window_rule({
    name  = "pip-pin",
    match = { title = "^(Picture-in-Picture)$" },
    float = true,
    pin   = true,
    pseudo = true,
})

hl.layer_rule({
    name  = "notifications-blur",
    match = { namespace = "notifications" },
    blur  = true,
})

-- ================================
-- Hyprland 0.56 Lua config
-- Сконвертировано из hyprland.conf
-- ================================

local mainMod = "SUPER"

-- ================================
-- ENVIRONMENT VARIABLES
-- ================================
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("GTK_THEME", "Adwaita:dark")
hl.env("GDK_SCALE", "1.6")
hl.env("XWAYLAND_SCALE", "1.6")

-- ================================
-- MONITOR
-- ================================
hl.monitor({
    output   = "eDP-1",
    mode     = "highrr",
    position = "0x0",
    scale    = 1.6,
})

-- ================================
-- XWAYLAND
-- ================================
hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
})

-- ================================
-- INPUT
-- ================================
hl.config({
    input = {
        kb_layout          = "us,ru",
        kb_options         = "grp:alt_shift_toggle",
        repeat_rate        = 60,
        repeat_delay       = 300,
        numlock_by_default = true,
        follow_mouse       = 1,
        sensitivity        = 0,

        touchpad = {
            natural_scroll = true,
            scroll_factor  = 0.2,
        },
    },
})

-- ================================
-- GESTURES
-- ================================
hl.gesture({
    fingers   = 3,
    direction = "horizontal",
    action    = "workspace",
})

hl.config({
    cursor = {
        hide_on_key_press = true,
        inactive_timeout  = 10,
    },
})

-- ================================
-- LOOK AND FEEL
-- ================================
hl.config({
    general = {
        border_size = 2,
        gaps_in     = 5,
        gaps_out    = 8,

        col = {
            -- Активная рамка: светлый градиент с "металлическим" бликом посередине
            active_border   = { colors = { "rgba(f0f0f0ee)", "rgba(9a9a9aee)", "rgba(f0f0f0ee)" }, angle = 45 },
            -- Неактивная: почти прозрачная тонкая линия, не спорит с контентом
            inactive_border = "rgba(ffffff1f)",
            -- Цветные варианты (раскомментируй один вместо активной рамки выше):
            -- active_border = { colors = { "rgba(89b4faee)", "rgba(cba6f7ee)" }, angle = 45 }, -- синий -> сиреневый
            -- active_border = { colors = { "rgba(f5c2e7ee)", "rgba(fab387ee)" }, angle = 45 }, -- розовый -> персиковый
            -- active_border = { colors = { "rgba(94e2d5ee)", "rgba(89b4faee)" }, angle = 45 }, -- мята -> синий
        },

        resize_on_border = true,
    },

    decoration = {
        rounding       = 12,
        rounding_power = 8,
        active_opacity   = 1,
        inactive_opacity = 0.9,

        blur = {
            enabled = true,
            size    = 6,
            passes  = 1,
            noise   = 0.02,
        },

        shadow = {
            enabled      = true,
            range        = 18,
            render_power = 3,
            color          = 0x70000000, -- активное окно: заметная мягкая тень (было rgba(00000070))
            color_inactive = 0x30000000, -- неактивное: почти без тени (было rgba(00000030))
        },
    },

    animations = {
        enabled = true,
    },

    misc = {
        force_default_wallpaper  = 0,
        disable_hyprland_logo    = true,
        disable_splash_rendering = true,
    },

    master = {
        new_status  = "slave",
        new_on_top  = true,
        orientation = "left",
        mfact       = 0.5,
    },

    dwindle = {
        force_split    = 2,
        preserve_split = true,
    },
})

-- ================================
-- BEZIERS & ANIMATIONS
-- ================================
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1} } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1} } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1} } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1} } })
hl.curve("epicEaseOut",    { type = "bezier", points = { {0.16, 1},    {0.3, 1} } })
hl.curve("easeOutExpo",    { type = "bezier", points = { {0.16, 1},    {0.3, 1} } })

hl.animation({ leaf = "windowsMove",    enabled = true, speed = 7,    bezier = "easeOutExpo",  style = "popin 100%" })
hl.animation({ leaf = "global",         enabled = true, speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",         enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",        enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",      enabled = true, speed = 4.1,  bezier = "easeOutQuint", style = "gnomed" })
hl.animation({ leaf = "windowsOut",     enabled = true, speed = 1.49, bezier = "linear",       style = "gnomed" })
hl.animation({ leaf = "fadeIn",         enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",        enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",           enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",         enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",       enabled = true, speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",      enabled = true, speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",   enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut",  enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",     enabled = true, speed = 3,    bezier = "easeOutQuint", style = "slide" })
hl.animation({ leaf = "workspacesIn",   enabled = true, speed = 4.5,  bezier = "easeOutQuint", style = "slidefade 15%" })
hl.animation({ leaf = "workspacesOut",  enabled = true, speed = 4.5,  bezier = "easeOutQuint", style = "slidefade 15%" })
hl.animation({ leaf = "zoomFactor",     enabled = true, speed = 7,    bezier = "quick" })

-- ================================
-- KEYBINDINGS
-- ================================

-- ---- Wallpaper switcher ----
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/rotate_wallpaper.sh"))

-- ---- Запуск приложений ----
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("nautilus"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("firefox"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("wofi --show drun"))

-- ---- Скриншоты ----
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region"))

-- ---- Блокировка ----
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))

-- ---- Quickshell IPC ----
-- hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("qs -p $HOME/.config/quickshell/minimalBar ipc call launcher toggle"))
hl.bind(mainMod .. " + ALT + SPACE",   hl.dsp.exec_cmd("qs -p $HOME/.config/quickshell/minimalBar ipc call rightIsland toggle"))
hl.bind(mainMod .. " + N",             hl.dsp.exec_cmd("qs -p $HOME/.config/quickshell/minimalBar ipc call notifications toggle"))
hl.bind(mainMod .. " + SHIFT + SPACE", hl.dsp.exec_cmd("qs -p $HOME/.config/quickshell/minimalBar ipc call bar toggle"))

-- ---- Выход ----
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exit())

-- ---- Управление окнами ----
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen_state({ internal = 2, client = 0, action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

-- ---- Фокус ----
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))  -- в исходнике было "ld", фактически это left
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",   hl.dsp.focus({ direction = "down" }))

-- ---- Обмен окнами ----
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.swap({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.swap({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.swap({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.swap({ direction = "d" }))

-- ---- Рабочие столы 1–10 (клавиша 0 = workspace 10) ----
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- ---- Специальный workspace (scratchpad) ----
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))

-- ---- Переключение рабочих столов колёсиком мыши ----
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- ---- Перетаскивание и изменение размера мышью ----
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- ---- Громкость, яркость, медиа ----
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"))

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"))

-- ---- Кнопка питания ----
hl.bind("XF86PowerOff", hl.dsp.exec_cmd("qs -p $HOME/.config/quickshell/minimalBar ipc call powerMenu toggle"))

-- ---- Скриншоты (Grim) ----
hl.bind("Print", hl.dsp.exec_cmd([=[grim -g "$(slurp)" - | wl-copy && notify-send "Screenshot" "Monitor copied to clipboard" -i clipboard]=]))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd([=[grim -o "$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name')" - | wl-copy && notify-send "Screenshot" "Monitor copied to clipboard" -i clipboard]=]))

-- ================================
-- WINDOW RULES
-- ================================

-- Подавление максимизации
hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

-- Фикс для XWayland перетаскиваний
hl.window_rule({
    name = "fix-xwayland-drags",
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

-- hyprland-run
hl.window_rule({
    name = "move-hyprland-run",
    match = { class = "hyprland-run" },
    float = true,
    move  = "20 monitor_h-120",
})

-- wiremix
hl.window_rule({
    name = "wiremix-term",
    match = { title = "^wiremix-term$", class = "com.mitchellh.ghostty" },
    float = true,
    move  = "1307 51",
    size  = "600 400",
})

-- bluetui
hl.window_rule({
    name = "bluetui-term",
    match = { title = "^bluetui-term$", class = "com.mitchellh.ghostty" },
    float = true,
    move  = "1307 51",
    size  = "600 800",
})

-- impala
hl.window_rule({
    name = "impala-term",
    match = { title = "^impala-term$", class = "com.mitchellh.ghostty" },
    float = true,
    move  = "1307 51",
    size  = "600 800",
})

-- sysmenu-tui
hl.window_rule({
    name = "sysmenu-tui",
    match = { title = "^sysmenu-tui$", class = "com.mitchellh.ghostty" },
    float  = true,
    center = true,
    size   = "900 600",
})

-- rencal
hl.window_rule({
    name = "rencal",
    match = { class = "^rencal$" },
    float  = true,
    center = true,
    size   = "66% 66%",
})

-- NautilusPreview
hl.window_rule({
    name = "nautilus-previewer",
    match = { class = "^org.gnome.NautilusPreviewer$" },
    float  = true,
    center = true,
    size   = "900 600",
})

-- Apple Music PWA
hl.window_rule({
    name = "apple-music-pwa",
    match = { class = "^chrome-blgdilankhbcpipclgpdndahbehalgkh-Default$" },
    workspace = "5 silent",
    no_shadow = true,
    opacity   = "1.0 override",
})

-- ================================
-- AUTOSTART (exec-once)
-- ================================
hl.on("hyprland.start", function()
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE && systemctl --user start hyprland-session.target")
    hl.exec_cmd("qs -p $HOME/.config/quickshell/minimalBar")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch $HOME/dotfiles/scripts/cliphist-export-live")
    hl.exec_cmd([=[sh -c 'eval $(gnome-keyring-daemon --start --components=secrets) && systemctl --user import-environment GNOME_KEYRING_CONTROL SSH_AUTH_SOCK']=])
end)

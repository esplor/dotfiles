import os
import subprocess
from pathlib import Path

from libqtile import bar, hook, layout, utils, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

alt = "mod1"
super = "mod4"
altgr = "mod5"
ctrl = "control"

# --- PATHS ---
HOME = Path.home()
QTILE_CONFIG_DIR = HOME / ".config" / "qtile"
QTILE_BIN_DIR = Path("/opt/qtile/bin")
WAL_BIN = QTILE_BIN_DIR / "wal"
WAL_CACHE = HOME / ".cache" / "wal"
WAL_COLORS = WAL_CACHE / "colors"


# --- APPS ---
BROWSERS = {
    "chrome": "google-chrome",
    "firefox": "firefox",
}

browser = BROWSERS["chrome"]
terminal = "kitty"
launcher = "rofi -show drun"
screen_lock = "slock"
control_sound = "pavucontrol -t 3"


def run_wal_and_reload(qtile):
    """Run wal and schedule a config reload to apply new colors."""
    wallpaper_dir = HOME / "Wallpapers"
    # Run wal in background
    subprocess.Popen(
        [
            str(WAL_BIN),
            "-i",
            str(wallpaper_dir),
            "--recursive",
            "-a",
            "80",
            "-b",
            "000000",
        ]
    )

    # Schedule config reload after wal completes
    from libqtile.widget import base

    def reload_after_delay():
        qtile.reload_config()

    # Use qtile's call_later to reload after 1 second
    qtile.call_later(0.1, reload_after_delay)


def run_wal():
    """Return a lazy command to run wal and reload config (for widget buttons)."""
    return lazy.function(run_wal_and_reload)


def create_button(icon, command, padding=6):
    """Create a clickable TextBox widget button."""
    return widget.TextBox(icon, mouse_callbacks={"Button1": command}, padding=padding)


brightness_day = "brightnessctl -d amdgpu_bl0 s 80%"
brightness_night = "brightnessctl -d amdgpu_bl0 s 15%"
no_screen_dim = "xset s off -dpms"


# Helper to create directional keybindings
def create_direction_keys():
    directions = {"Left": "left", "Right": "right", "Down": "down", "Up": "up"}
    direction_keys = []

    # Basic navigation (super + arrow)
    for arrow, direction in directions.items():
        direction_keys.append(
            Key(
                [super],
                arrow,
                getattr(lazy.layout, direction)(),
                desc=f"Move focus to {direction}",
            )
        )

    # Shuffle windows (super + shift + arrow)
    for arrow, direction in directions.items():
        direction_keys.append(
            Key(
                [super, "shift"],
                arrow,
                getattr(lazy.layout, f"shuffle_{direction}")(),
                desc=f"Move window to the {direction}",
            )
        )

    # Grow/shrink (super + control + arrow)
    grow_commands = {
        "Left": ("shrink", "Shrink window to the left"),
        "Right": ("grow", "Grow window to the right"),
        "Down": ("grow_down", "Grow window down"),
        "Up": ("grow_up", "Grow window up"),
    }
    for arrow, (cmd, desc) in grow_commands.items():
        direction_keys.append(
            Key([super, "control"], arrow, getattr(lazy.layout, cmd)(), desc=desc)
        )

    return direction_keys


keys = [
    *create_direction_keys(),
    # ---
    Key([super], "space", lazy.spawn(launcher), desc="Spawn launcher"),
    Key([super, "shift"], "space", lazy.layout.flip()),
    Key([super], "l", lazy.spawn(screen_lock), desc="Lock screen"),
    Key(
        [super, "control"], "n", lazy.layout.normalize(), desc="Reset all window sizes"
    ),
    Key([super, "shift"], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([super], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    # Multiple ways to kill focused window
    Key([super], "Backspace", lazy.window.kill(), desc="Kill focused window"),
    Key([], "F12", lazy.window.kill(), desc="Kill focused window"),
    Key([altgr], "Backspace", lazy.window.kill(), desc="Kill focused window"),
    Key(
        [super],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    Key(
        [super],
        "t",
        lazy.window.toggle_floating(),
        desc="Toggle floating on the focused window",
    ),
    Key(
        [ctrl, alt],
        "Right",
        lazy.screen.next_group(skip_empty=True),
        desc="Navigate to next non-empty workgroup",
    ),
    Key(
        [ctrl, alt],
        "Up",
        lazy.screen.next_group(),
        desc="Navigate to next workgroup",
    ),
    Key(
        [ctrl, alt],
        "Down",
        lazy.screen.prev_group(),
        desc="Navigate to previous workgroup",
    ),
    Key(
        [ctrl, alt],
        "Left",
        lazy.screen.prev_group(skip_empty=True),
        desc="Navigate to previous non-empty workgroup",
    ),
    Key([super, "shift"], "i", lazy.spawn(browser), desc=f"Spawn {browser}"),
    Key([super, "shift"], "r", lazy.reload_config(), desc="Reload qtile config"),
    Key([super, "shift"], "Backspace", lazy.shutdown(), desc="Shutdown qtile"),
    Key(
        [super, "shift"],
        "s",
        lazy.spawn(control_sound),
        desc=f"Spawn {control_sound}",
    ),
    Key([super, "shift"], "t", lazy.spawn("st"), desc="Spawn suckless terminal"),
]

groups = [
    Group("1"),
    Group("2"),
    Group("3"),
    Group("4"),
    Group("5"),
    Group("6"),
    Group(
        "7",
        matches=[Match(wm_class="google-chrome")],
    ),
    Group(
        "V",
        matches=[Match(wm_class="Code")],
    ),
    Group(
        "P",
        matches=[Match(wm_class="Plex")],
        layout="max",
    ),
]
for i in groups:
    keys.extend(
        [
            # mod + group number = switch to group
            Key(
                [super],
                i.name,
                lazy.group[i.name].toscreen(),
                desc=f"Switch to group {i.name}",
            ),
            # mod + shift + group number = switch to & move focused window to group
            Key(
                [super, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=False),
                desc=f"Switch to & move focused window to group {i.name}",
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod + shift + group number = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

# Initialize colors with defaults in case wal hasn't run yet
colors = [
    "#000000",  # 0 - background
    "#333333",  # 1 - border normal
    "#666666",  # 2 - foreground/inactive
    "#888888",  # 3
    "#aaaaaa",  # 4
    "#cccccc",  # 5
    "#ffffff",  # 6 - border focus/highlight
    "#eeeeee",  # 7 - active
    "#ffffff",  # 8 - white
]


def load_colors(color_file=None):
    global colors
    if color_file is None:
        color_file = WAL_COLORS
    try:
        with open(color_file, "r") as file:
            colors = []
            for _ in range(8):
                colors.append(file.readline().strip())
            colors.append("#ffffff")
    except FileNotFoundError:
        # Keep default colors if wal hasn't generated colors yet
        pass


# Load colors from wal cache at startup (if available)
load_colors()


layout_theme = {
    "border_width": 3,
    "margin": 8,
    "border_focus": colors[6],
    "border_normal": colors[1],
    "single_border_width": 3,
    "single_margin": 0,
    "ratio": 0.55,
}

layouts = [
    layout.MonadTall(**layout_theme),
    # layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"],),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    active=colors[7],
    inactive=colors[2],
    foreground=colors[2],
    block_highlight_text_color=colors[6],  # Text for active tab
    this_current_screen_border=colors[2],  # Box around active tab
    font="JetBrainsMono Nerd Font",
    fontsize=16,
    padding=5,
    size_percent=60,
    highlight_method="block",
)


extension_defaults = widget_defaults.copy()


screens = [
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayout(mode="icon", scale=0.6),
                widget.Sep(padding=10),
                widget.GroupBox(padding=1),
                widget.Sep(),
                widget.Prompt(),
                widget.WindowName(fmt="<i>{}</i>"),
                #                widget.Notify(
                #                    width=500,
                #                    scroll=True,
                #                    scroll_step=5,
                #                    default_timeout_low=5,
                #                ),
                widget.Systray(),
                widget.Battery(format="B:{char}{percent:2.0%}"),
                widget.Clock(format="󰨴 %U 󰸘 %d.%m.%Y %H:%M "),
                widget.Sep(),
                create_button("󰃝", lazy.spawn(brightness_night, shell=True)),
                create_button("󰃠", lazy.spawn(brightness_day, shell=True)),
                create_button("󱎴", lazy.spawn(no_screen_dim, shell=True)),
                create_button("󰸉", run_wal()),
                create_button("", lazy.spawn(control_sound)),
                # widget.Wallpaper(
                #     directory="~/Wallpapers/",
                #     label="󰸉",
                #     wallpaper_command=None,
                #     padding=10,
                # ),
                create_button("󰔍", lazy.spawn(no_screen_dim)),
                create_button("", lazy.spawn(screen_lock)),
                widget.Sep(padding=20),
                widget.QuickExit(default_text="[󰐥]"),
            ],
            32,
            margin=[0, 0, 5, 0],  # Top, left, bottom, right
            background=colors[0],
            border_width=[0, 0, 2, 0],  # Draw bottom border
            border_color=[
                colors[2],
                "000000",
                colors[2],
                "000000",
            ],  # Borders are magenta
        ),
        # You can uncomment this variable if you see that on X11 floating resize/moving is laggy
        # By default we handle these events delayed to already improve performance, however your system might still be struggling
        # This variable is set to None (no cap) by default, but you can set it to 60 to indicate that you limit it to 60 events per second
        # x11_drag_polling_rate = 60,
    ),
]

# Drag floating layouts.
mouse = [
    Drag(
        [super],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [super],
        "Button3",
        lazy.window.set_size_floating(),
        start=lazy.window.get_size(),
    ),
    Click([super], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = False
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(wm_class="pavucontrol"),  # PulseAudio
        Match(wm_class="qemu"),  # Yocto runqemu
        Match(wm_class="galculator"),  # Calculator
        Match(wm_class="gnome-calculator"),  # Calculator
        Match(wm_class="VirtualBox Machine"),
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
        # Float if window have parent
        Match(func=lambda c: c.is_transient_for()),
    ]
)

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True


@hook.subscribe.startup_once
def autostart():
    """Run autostart.sh and randomize wallpaper on fresh login."""
    autostart_script = QTILE_CONFIG_DIR / "autostart.sh"
    subprocess.run([str(autostart_script)])

    # Randomize wallpaper on fresh login (not on qtile restart/reload)
    wallpaper_dir = HOME / "Wallpapers"
    # Run wal synchronously so colors are generated before qtile finishes loading
    subprocess.run(
        [
            str(WAL_BIN),
            "-i",
            str(wallpaper_dir),
            "--recursive",
            "-a",
            "80",
            "-b",
            "000000",
        ]
    )


@hook.subscribe.startup_complete
def reload_after_wal():
    """Reload config after startup to apply newly generated wal colors."""
    import libqtile

    qtile = libqtile.qtile
    qtile.reload_config()


# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# xcursor theme (string or None) and size (integer) for Wayland backend
wl_xcursor_theme = None
wl_xcursor_size = 24

# INFO: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

import subprocess

from libqtile import bar, hook, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

alt = "mod1"
super = "mod4"
altgr = "mod5"
ctrl = "control"

# --- APPS ---
# browser = "google-chrome"
browser = "google-chrome"
terminal = "kitty"
launcher = "rofi -show drun"
screen_lock = "slock"

brightness_day = "brightnessctl -d amdgpu_bl0 s 80%"
brightness_night = "brightnessctl -d amdgpu_bl0 s 15%"
no_screen_dim = "xset s off -dpms"

keys = [
    # Navigate windows
    Key([super], "Left", lazy.layout.left(), desc="Move focus to left"),
    Key([super], "Right", lazy.layout.right(), desc="Move focus to right"),
    Key([super], "Down", lazy.layout.down(), desc="Move focus down"),
    Key([super], "Up", lazy.layout.up(), desc="Move focus up"),
    # ---
    Key([super], "space", lazy.spawn(launcher), desc="Spawn launcher"),
    Key([super, "shift"], "space", lazy.layout.flip()),
    Key([super], "l", lazy.spawn(screen_lock), desc="Lock screen"),
    Key(
        [super, "shift"],
        "Left",
        lazy.layout.shuffle_left(),
        desc="Move window to the left",
    ),
    Key(
        [super, "shift"],
        "Right",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([super, "shift"], "Down", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([super, "shift"], "Up", lazy.layout.shuffle_up(), desc="Move window up"),
    Key(
        [super, "control"],
        "Left",
        lazy.layout.shrink(),
        desc="Grow window to the left",
    ),
    Key(
        [super, "control"],
        "Right",
        lazy.layout.grow(),
        desc="Grow window to the right",
    ),
    Key([super, "control"], "Down", lazy.layout.grow_down(), desc="Grow window down"),
    Key([super, "control"], "Up", lazy.layout.grow_up(), desc="Grow window up"),
    Key(
        [super, "control"], "n", lazy.layout.normalize(), desc="Reset all window sizes"
    ),
    Key([super, "shift"], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([super], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
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
        desc="Navigate to next workgroup",
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
        desc="Navigate to previous workgroup",
    ),
    Key([super, "shift"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([super, "shift"], "Backspace", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([super], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([super, "shift"], "i", lazy.spawn(browser), desc="Spawn browser"),
    Key(
        [super, "shift"],
        "s",
        lazy.spawn("pavucontrol -t 3"),
        desc="Spawn sound control",
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
        "I",
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
            #            Key(
            #                [super, "shift"],
            #                i.name,
            #                lazy.window.togroup(i.name, switch_group=False),
            #                desc=f"Switch to & move focused window to group {i.name}",
            #            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod + shift + group number = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

colors = []
cache = "/home/eslo/.cache/wal/colors"


# TODO: Move this to a function collection
def load_colors(cache):
    with open(cache, "r") as file:
        for _ in range(16):
            colors.append(file.readline().strip())
    colors.append("#ffffff")
    lazy.reload()


load_colors(cache)

manual_colors = dict(
    active="#a9b1d6",
    inactive="#565f89",
    highlight="#bb9af7",
    fg="#414868",
    bg="#1a1b26",
)

layout_theme = {
    "border_width": 3,
    "margin": 8,
    "border_focus": colors[6],
    "border_normal": colors[2],
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
    active=colors[6],
    inactive=colors[1],
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
                widget.Notify(
                    width=500,
                    scroll=True,
                    scroll_step=5,
                    default_timeout_low=5,
                ),
                widget.Systray(),
                widget.Battery(format="B:{char}{percent:2.0%}"),
                widget.Clock(format="󰨴 %U 󰸘 %d.%m.%Y %H:%M "),
                widget.Sep(),
                widget.TextBox(
                    "󰃝",
                    mouse_callbacks={
                        "Button1": lazy.spawn(
                            brightness_night,
                            shell=True,
                        )
                    },
                    padding=6,
                ),
                widget.TextBox(
                    "󰃠",
                    mouse_callbacks={
                        "Button1": lazy.spawn(
                            brightness_day,
                            shell=True,
                        )
                    },
                    padding=6,
                ),
                widget.TextBox(
                    "󱎴",
                    mouse_callbacks={
                        "Button1": lazy.spawn(
                            no_screen_dim,
                            shell=True,
                        )
                    },
                    padding=6,
                ),
                widget.TextBox(
                    "󰸉",
                    mouse_callbacks={
                        "Button1": lazy.spawn(
                            "/opt/qtile/bin/wal -b 000000 -a 80 -i ~/Wallpapers/ --recursive",
                            shell=True,
                        )
                    },
                    padding=6,
                ),
                widget.TextBox(
                    "",
                    mouse_callbacks={"Button1": lazy.spawn("pavucontrol -t 3")},
                    padding=6,
                ),
                # widget.Wallpaper(
                #     directory="~/Wallpapers/",
                #     label="󰸉",
                #     wallpaper_command=None,
                #     padding=10,
                # ),
                widget.TextBox(
                    "󰔍",
                    mouse_callbacks={"Button1": lazy.spawn("xset s off -dpms")},
                    padding=6,
                ),
                widget.TextBox(
                    "",
                    mouse_callbacks={"Button1": lazy.spawn("slock")},
                    padding=6,
                ),
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
        Match(func=lambda c: c.is_transient_for()),  # Float if window have parent
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
    subprocess.run(["/home/eslo/.config/qtile/autostart.sh"])
    load_colors(cache)


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

import subprocess

from libqtile import bar, hook, layout
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

from qtile_extras import widget

mod = "mod1"
super = "mod4"
altgr = "mod5"
ctrl = "control"
browser = "google-chrome"
terminal = "kitty"
launcher = "rofi -show drun"
locker = "slock"

keys = [
    Key([mod], "Left", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "Right", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "Down", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "Up", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.spawn(launcher), desc="Spawn launcher"),
    Key([super], "l", lazy.spawn(locker), desc="Lock screen"),
    Key(
        [mod, "shift"],
        "Left",
        lazy.layout.shuffle_left(),
        desc="Move window to the left",
    ),
    Key(
        [mod, "shift"],
        "Right",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up(), desc="Move window up"),
    Key(
        [mod, "control"],
        "Left",
        lazy.layout.shrink(),
        desc="Grow window to the left",
    ),
    Key(
        [mod, "control"],
        "Right",
        lazy.layout.grow(),
        desc="Grow window to the right",
    ),
    Key([mod, "control"], "Down", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "Up", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod, "control"], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "Backspace", lazy.window.kill(), desc="Kill focused window"),
    Key([], "F12", lazy.window.kill(), desc="Kill focused window"),
    Key([altgr], "Backspace", lazy.window.kill(), desc="Kill focused window"),
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    Key(
        [mod],
        "t",
        lazy.window.toggle_floating(),
        desc="Toggle floating on the focused window",
    ),
    Key([mod, "shift"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "shift"], "Backspace", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([mod, "shift"], "i", lazy.spawn(browser), desc="Spawn browser"),
    Key(
        [mod, "shift"], "s", lazy.spawn("pavucontrol -t 3"), desc="Spawn sound control"
    ),
    Key([mod, "shift"], "t", lazy.spawn("st"), desc="Spawn suckless terminal"),
]

groups = [Group(i) for i in "123456789"]
for i in groups:
    keys.extend(
        [
            # mod + group number = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc=f"Switch to group {i.name}",
            ),
            # mod + shift + group number = switch to & move focused window to group
            Key(
                [mod, "shift"],
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
    # layout.Max()
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
                widget.CurrentLayoutIcon(scale=0.6),
                # widget.CurrentLayout(),
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
                widget.PulseVolume(
                    emoji=True, limit_max_volume=True, step=5, device="0"
                ),
                widget.UPowerWidget(
                    fill_normal=colors[2],
                    border_charge_colour=colors[2],
                    percentage_low=0.4,
                ),
                widget.Clock(format=" 󰨴 %U 󰸘 %d.%m.%Y %H:%M "),
                widget.Sep(),
                widget.TextBox(
                    "",
                    mouse_callbacks={"Button1": lazy.spawn("pavucontrol -t 3")},
                    padding=10,
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
                    padding=10,
                ),
                widget.TextBox(
                    "",
                    mouse_callbacks={"Button1": lazy.spawn("slock")},
                    padding=10,
                ),
                widget.Sep(padding=20),
                widget.QuickExit(default_text="[󰐥]", countdown_format="[{}]"),
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
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
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
        Match(wm_class="Pavucontrol"),  # PulseAudio
        Match(wm_class="qemu"),  # Yocto runqemu
        Match(wm_class="galculator"),  # Yocto runqemu
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
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

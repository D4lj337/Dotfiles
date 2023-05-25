import os, subprocess
from libqtile import hook
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen, ScratchPad, DropDown
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from typing import List

mod = "mod4"
terminal = "kitty -e tmux"
browser = "librewolf --profilemanager"
dmenu = "./.config/qtile/scripts/dmenu.sh"
filemanager = "thunar"
ytfzf = "ytfzf -m -D"

bg = "#000000" 
fg = "#8d9fa1"

keys = [
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod], "l", lazy.layout.grow_right(), desc="Grow window to the left"),
    Key([mod], "j", lazy.layout.grow_down(), desc="Grow window up"),
    Key([mod], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "r", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl s 5%+")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl s 5%-")),
    Key([mod, "shift"],"Return",lazy.layout.toggle_split(),desc="Toggle between split and unsplit sides of stack",),
    Key([mod, "shift"], "b", lazy.hide_show_bar("top"), desc="Hide Bar"),
    # Null Keys
    Key(["control"], "q", lazy.spawn(), desc="Reset all window sizes"),
    # Applications
    Key([mod], "x", lazy.spawn(terminal),),
    Key([mod], "b", lazy.spawn(browser),),
    Key([mod], "p", lazy.spawn(dmenu),),
    Key([mod], "f", lazy.spawn(filemanager),),
    Key([mod], "q", lazy.to_screen(1),),
    Key([mod], "w", lazy.to_screen(0),),
    Key([mod], "y", lazy.spawn(ytfzf),),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "c", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "shift"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "shift"], "q", lazy.spawn("./.config/qtile/scripts/shutdown.sh"),),
    # Sound
    Key([], "XF86AudioMute", lazy.spawn("amixer -q set Master toggle")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -c 0 sset Master 1- unmute")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -c 0 sset Master 1+ unmute")),
    Key(["control"], "9", lazy.spawn("amixer -q set Master 5%-")),
    Key(["control"], "0", lazy.spawn("amixer -q set Master 1%+")),
    Key(["control"], "m", lazy.spawn("pactl set-sink-mute 0 toggle")),
    Key(["control", "shift"], "1", lazy.spawn("xrandr --output eDP --off")),
    Key(["control", "shift"], "2", lazy.spawn("xrandr --output eDP --auto --left-of HDMI-A-0")),
    Key([mod, "shift"], "f", lazy.window.toggle_fullscreen()),
    #mpris2
]

groups = [Group("一"),
          Group("二"),
          Group("三"),
          Group("四"),
          Group("五"),
          Group("六"),
          Group("七"),
          Group("八"),
          Group("九"),
          Group("十")]

from libqtile.dgroups import simple_key_binder
dgroups_key_binder = simple_key_binder("mod4")

# ScratchPad
groups.append(ScratchPad('scratchpad', [
    DropDown('term', 'kitty', width=0.5, height=0.55, x=0.26, y=0.1, opacity=1, on_focus_lost_hide=True, warp_pointer=True),
    DropDown('nvim', 'kitty -e nvim', width=0.5, height=0.55, x=0.26, y=0.1, opacity=1, on_focus_lost_hide=True),
    DropDown('emacs', 'emacs', width=0.5, height=0.55, x=0.26, y=0.1, opacity=1, on_focus_lost_hide=True),
    ]))

keys.extend([ 
       Key([mod], "t", lazy.group['scratchpad'].dropdown_toggle('term')),
       Key([mod], "n", lazy.group['scratchpad'].dropdown_toggle('nvim')),
             ])

layout_theme = {
    "border_width": 3,
    "margin": 0,
    "border_focus":fg,
    "grow_amount": 2,
}

layouts = [
    layout.Columns(**layout_theme),
    # layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="UbuntuMono NFM Medium",
  #  font="JetBrainsMono NFM Medium",
    fontsize=11,
    padding=5,
    background=bg,
    foreground=fg,
)

extension_defaults = widget_defaults.copy()

def init_widgets_list():
    widgets_list = [
                widget.GroupBox(
                                this_current_screen_border="#2677AB",
                                highlight_method='line',
                                active="#ffffff",
                                disable_drag="False",
                                ),
                widget.WindowName(
                                 max_chars=30,
                                 for_current_screen="False",
                                 format='{state}{name}',
                                  foreground="#ffffff",
                                  ),
                widget.Pomodoro(color_break={'ffff00'}, 
                    notification_on=True,
                    length_pomodori=90,
                    length_long_break=10,
                    lenght_short_break=5,
                    color_active='ffffff', 
                    color_inactive="2677AB",
                    prefix_inactive='Pomodoro ',
                    prefix_break='Break',
                    prefix_long_break='LB',
                    prefix_paused='Paused',
                    ),
                widget.CPU(
                    format='{load_percent}%',
                    foreground="#ffffff",
                    ),
                widget.Memory(
                    format='{MemUsed: .0f}',
                    foreground="#ffffff",
                    ),
                widget.ThermalSensor(
                    foreground="#ffffff",
                    fmt = '{}',
                    padding=5,
                    threshold=70,
                    ),
                widget.Volume(fmt = '{}',
                    foreground="#ffffff",
                              ),
                widget.Clock(
                        format="%a %I:%M%p %Y-%m-%d",
                        foreground="#ffffff",
                        ),
                widget.Systray(),
              ]
    return widgets_list

def init_widgets_screen1():
    widgets_screen1 = init_widgets_list()
    del widgets_screen1[9:10]               # Slicing removes unwanted widgets (systray) on Monitors 1,3
    return widgets_screen1

def init_widgets_screen2():
    widgets_screen2 = init_widgets_list()
    return widgets_screen2                 # Monitor 2 will display all widgets in widgets_list

def init_screens():
    return [Screen(top=bar.Bar(widgets=init_widgets_screen1(), opacity=1.0, size=20)),
            Screen(top=bar.Bar(widgets=init_widgets_screen2(), opacity=1.0, size=20)),
            Screen(top=bar.Bar(widgets=init_widgets_screen1(), opacity=1.0, size=20))]

if __name__ in ["config", "__main__"]:
    screens = init_screens()
    widgets_list = init_widgets_list()
    widgets_screen1 = init_widgets_screen1()
    widgets_screen2 = init_widgets_screen2()

def window_to_prev_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i - 1].name)

def window_to_next_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i + 1].name)

def window_to_previous_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i != 0:
        group = qtile.screens[i - 1].group.name
        qtile.current_window.togroup(group)

def window_to_next_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i + 1 != len(qtile.screens):
        group = qtile.screens[i + 1].group.name
        qtile.current_window.togroup(group)

def switch_screens(qtile):
    i = qtile.screens.index(qtile.current_screen)
    group = qtile.screens[i - 1].group
    qtile.current_screen.set_group(group)

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False

floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="librewolf --profilemanager"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# Pywal
#colors = []
#cache = os.path.expanduser( '~/.cache/wal/colors' )
#def load_colors(cache):
#    with open(cache, 'r') as file:
#        for i in range(8):
#            colors.append(file.readline().strip())
#    colors.append('#ffffff')
#    lazy.reload()
#load_colors(cache)

# Autostart
@hook.subscribe.startup
def autostart():
    home = os.path.expanduser('~/.config/qtile/scripts/autostart.sh')
    subprocess.Popen([home])

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

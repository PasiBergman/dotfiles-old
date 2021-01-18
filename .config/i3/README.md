# i3 WM

i3 window manager configuration

## Key bindings cheat sheet

| Variable | Key |
|--|--|
| `$mod` | Command |
| `$sub` | Option |
| `$ctr` | Control |

## Helper programs

| Program | Description / usage |
|--|--|
| `xev` | Show the keycodes to bind with `bindcode` instead of `bindsym`. |
| `xmodmap` | View control key mods. |
| `xprop` | View the window class. |

## Window actions

### General

| Key binding | Action |
|--|--|
| `$mod`+Mouse | Drag floating window |
| `$mod+Enter` | Start a terminal (termite) |
| `$mod+Shift+c` | Kill focused window |
| `$mod+d` | Open launcher to start a program |
| `$mod+w` | Open launcher to close a window |
| `$mod+Shift+b` | Open Brave Browser |

### Change focus, move and view

| Key binding | Action |
|--|--|
| `$mod+h` | Move focus to window on the **left** |
| `$mod+j` | Move focus to window **below** |
| `$mod+k` | Move focus to window **above** |
| `$mod+l` | Move focus to window on the **right** |
| `$mod+Shift+a` | Focus the parent container |
| `$mod+Shift+h` | Move window to **left** |
| `$mod+Shift+j` | Move window to **below** |
| `$mod+Shift+k` | Move window to **above** |
| `$mod+Shirt+l` | Move window to **right** |
| `$mod+Shift+z` | Create next window to the right (horiZontal) |
| `$mod+Shift+v` | Create next window to below (Vertical) |
| `$mod+Shift+s` | Use stacked window layout |
| `$mod+Shift+w` | Use tabbed window layout |
| `$mod+e` | Use split window layout |
| `$mod+f` | Toggle full screen the focused window |

### Workspaces

| Key binding | Action |
|--|--|
| `$mod+<number>` | Set workspace `<number>` active |
| `$ctr+<number>` | Move window/container to workspace `<number>` active |

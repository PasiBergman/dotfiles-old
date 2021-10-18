#!/usr/bin/python3

# Where to store kitty configuration
color_file = './kitty_colorscheme.conf'
# Hash with dark/light colorschemes, background type => vim colorscheme nane
colorschemes = {
    'dark': 'gruvbox',
    'light': 'xcodelight',
}

import pynvim
import argparse
import os
import sys
from pathlib import Path

parser = argparse.ArgumentParser()
parser.add_argument('bg', nargs='?', default=None, choices=['dark', 'light', 'toggle'])

nvim = pynvim.attach('child', argv=["/usr/bin/env", "lvim", "--embed", "--headless"])

def get_hl_color(name):
    hl_output = nvim.call('execute', 'hi ' + name)
    bgcolor = None
    fgcolor = None
    for item in hl_output.split('\n')[1].split():
        if item.startswith('guifg'):
            fgcolor = item.split('=')[1]
        if item.startswith('guibg'):
            bgcolor = item.split('=')[1]
    return fgcolor or '', bgcolor or ''

normal_fg, normal_bg = get_hl_color('Normal')
cursor_fg, cursor_bg = get_hl_color('Cursor')
selection_fg, selection_bg = get_hl_color('Visual')

command = [
    'foreground ' + normal_fg,
    'background ' + normal_bg,
    'cursor ' + (cursor_bg.startswith('#') and cursor_bg or normal_fg),
    'cursor_text_color ' + (cursor_fg.startswith('#') and cursor_fg or 'background'),
    'selection_foreground ' + (selection_fg.startswith('#') and selection_fg or 'none'),
    'selection_background ' + (selection_bg.startswith('#') and selection_bg or normal_fg)
]

for i in range(0, 16):
    command.append('color' + str(i) + ' ' + nvim.eval('g:terminal_color_' + str(i)))

nvim.close()

file = open(color_file, 'w')
file.write('\n'.join(command))
file.close()

print("Run completed. See file", color_file)
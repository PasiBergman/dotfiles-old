# tmux configuration files

Files for tmux configuration and project startups

Close repository to `~/.config/tmux` folder, i.e.

```shell
git clone git@github.com:PasiBergman/tmux.git ~/.config/tmux
```

Make a symbolic link from `~/.tmux.conf` to file `~/.config/tmux/.tmux.conf`

```shell
~/.config/tmux/create-link-for-tmux-conf.sh
```

Add the following line to .bashrc or .zshrc

```bash
[ -f ~/.config/tmux/aliases.sh ] && source ~/.config/tmux/aliases.sh
```

```bash
echo "[ -f ~/.config/tmux/aliases.sh ] && source ~/.config/tmux/aliases.sh" >> ~/.zshrc
```

## Projects

```shell
tmux-oet
tmux-massa
tmux-nvim
tmux-tmux
```

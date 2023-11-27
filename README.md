# IMPORTANT NOTICE

**I'm moving to GNU Stow instead of using git bare repository during 11/2023.**

# dotfiles

Collection of macOS/Linux configuration files, including Neovim (Nvim).

IMPORTANT! Neovim configuration requires version 0.5+

## dotfiles installation

- Choose a folder name for your dotfiles and store the name to a variable. Store also the URL of the dotfiles repository

```shell
DOTFILES_DIR=".dotfiles"
REPO_URL="git@github.com:PasiBergman/dotfiles.git"
MY_SHELL_RC_FILE=".zshrc"
```

- Make sure, that there is an `dot` alias. Note! Change the git-dir value based on the directory that you'll later choose to clone the dotfiles repository to.

```shell
alias dot='git --git-dir=$HOME/$DOTFILES_DIR/ --work-tree=$HOME'
```

- Add dotfiles directory to `.gitignore` file to avoid recursion problems.

```shell
cd $HOME && echo "$DOTFILES_DIR" >> .gitignore
```

- Clone dotfiles to a **bare** (i.e. empty) repository in your `$HOME/$DOTFILES_DIR` path.

```shell
git clone --bare $REPO_URL $HOME/$DOTFILES_DIR
```

- Checkout the repository content to $HOME directory. Note! You may get an error about `untracked working tree`, it means that the chekcout would overwrite existing files, which are listed in the error message. Remove or move the existing files to safe location and repeat the repository checkout.

```shell
cd $HOME
dot checkout
```

- Use flag `showUntrackedFiles` with value `no` to disable listing untracked files.

```shell
dot config --local status.showUntrackedFiles no
```

- Done. Use command `dot` (instead of `git`) to **add**, **commit**, **push** etc. dotfiles.

## Initial creation of the repository

```shell
DOTFILES_DIR=".dotfiles"
MY_SHELL_RC_FILE=".zshrc"
REPO_URL="git@github.com:PasiBergman/dotfiles.git"

cd $HOME
git init --bare $HOME/$DOTFILES_DIR
alias dot='git --git-dir=$HOME/$DOTFILES_DIR/ --work-tree=$HOME'
dot config --local status.showUntrackedFiles no
echo "alias dot='git --git-dir=$HOME/$DOTFILES_DIR/ --work-tree=$HOME'" >> $HOME/$MY_SHELL_RC_FILE
```

## Usage

Example:

```shell
REPO_URL="git@github.com:PasiBergman/dotfiles.git"
cd $HOME
dot status
dot add .config/nvim/init.vim
dot commit -m "Add nvim configuration"
dot add .zshrc
dot commit -m "Add zshrc"
dot pull $REPO_URL
dot push $REPO_URL
```

## Credits

https://www.atlassian.com/git/tutorials/dotfiles

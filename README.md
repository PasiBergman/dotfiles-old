# dotfiles

Collection of macOS/Linux configuration files.

## dotfiles installation

- Choose a folder name for your dotfiles and store the name to a variable. Store also the URL of the dotfiles repository

```shell
DOTFILES_DIR="dotfiles"
REPO_URL="git@github.com:PasiBergman/dotfiles.git"
```

- Make sure, that ythere is an `dotfiles` alias. Note! Change the git-dir value based on the directory that you'll later choose to clone the dotfiles repository to.

```shell
alias dotfiles='git --git-dir=$HOME/$DOTFILES_DIR/ --work-tree=$HOME'
```

- Make  dotfiles directory to `.gitignore` file to avoit recursion problems.

```shell
cd $HOME && echo "$DOTFILES_DIR" >> .gitignore
```

- Clonet dotfiles to a **bare** (i.e. empty) repository in your `$HOME/$DOTFILES_DIR` path.

```shell
git clone --bare $REPO_URL $HOME/$DOTFILES_DIR
```

- Checkout the repository content to $HOME directory. Note!  You may get an error about `untracked working tree`, it means that the chekcout would overwrite existing files, which are listed in the error message.  Remove or move the existing files to safe location and repeat the repository checkout.

```shell
cd $HOME
dotfiles checkout
```

- Use flag `showUntrackedFiles` with value `no` to disable listing untracked files. 

```shell
dotfiles config --local status.showUntrackedFiles no
```

- Done. Use command `dotfiles` (instead of `git`) to **add**, **commit**, **push** etc. dotfiles.¨


## Initial creation of the repository

```shell
DOTFILES_DIR="dotfiles"
MY_SHELL_RC_FILE=".zshrc"
REPO_URL="git@github.com:PasiBergman/dotfiles.git"

cd $HOME
git init --bare $HOME/$DOTFILES_DIR
alias dotfiles='git --git-dir=$HOME/$DOTFILES_DIR/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
echo "alias dotfiles='git --git-dir=$HOME/$DOTFILES_DIR/ --work-tree=$HOME'" >> $HOME/$MY_SHELL_RC_FILE
```

## Usage

Example:

```shell
cd $HOME
dotfiles status
dotfiles add .config/nvim/init.vim
dotfiles commit -m "Add nvim configuration"
dotfiles add .zshrc
dotfiles commit -m "Add zshrc"
dotfiles pull
dotfiles push
```

# Installing Arch Linux Arm to Raspberry Pi 4

## Preparations and initial installation

Preparations and initial installation is made on separate, running Linux computer/environment. 

- Log in as root

```shell
su -
```

- Check the disk id and partitions

```shell
fdisk -l
```

- Start partition tool. Replace X with the id of the disk.

```shell
cfdisk /dev/sdX
```

- Create the following partition table. The size of the Linux partition (`/dev/sdX2`) is the rest of the storage.

| Partition | Size | Bootable | Id | Type                     |
| --------- | ---- | -------- | -- | ------------------------ |
| /dev/sdX1 | 500M | Yes      | c  | W95 FAT32 (LBA)          |
| /dev/sdX2 | x G  |          | 83 | Linux                    |

- Format boot partition, create boot folder and mount the partition

```shell
mkfs.vfat /dev/sdX1
mkdir boot
mount /dev/sdX1 boot
```

- Format root partition, create root folder and mount the partition

```shell
mkfs.ext4 /dev/sdX2
mkdir root
mount /dev/sdX2 root
```

- Download and extract the root filesystem (as root, not via sudo)

```shell
wget http://os.archlinuxarm.org/os/ArchLinuxARM-rpi-4-latest.tar.gz
bsdtar -xpf ArchLinuxARM-rpi-4-latest.tar.gz -C root
sync
```

- Move boot files to the first partition

```shell
mv root/boot/* boot
```

### Steps to enable USB boot (if required)

USB boot on Arch ARM requires (1/2021) a SD card + USB drive both prepared with the steps above. You need to make the following changes to BOTH, SD card and USB drive.

- Edit `boot/cmdline.txt` file. Change root to point to `/dev/sda2`

```shell
vi boot/cmdline.txt
cat boot/cmdline.txt
```

```txt
root=/dev/sda2 rw rootwait console=ttyAMA0,115200 console=tty1 selinux=0 plymouth.enable=0 smsc95xx.turbo_mode=N dwc_otg.lpm_enable=0 kgdboc=ttyAMA0,115200 elevator=noop
```

- Edit `root/etc/fstab` file. Change the filesystem to value `/dev/sda1`

```shell
vi root/etc/fstab
cat root/etc/fstab
```

```txt
# Static information about the filesystems.
# See fstab(5) for details.

# <file system> <dir> <type> <options> <dump> <pass>
/dev/sda1  /boot   vfat    defaults        0       0
```

- Unmount the partitions

```shell
umount boot root
```

## Configuration

Configuration is done on Raspberry Pi after completing a SD card and/or USB drive preparations and initial installation.

Insert prepared SD card (and USB disk if applicable) to Raspberry Pi and boot.

- Login as `alarm` with password `alarm`. Which to `root` user. Root password is `root`

```shell
su -
```

- Setup keyboard layout

```shell
loadkeys fi
```

- Change the password of `root` and `alarm`

```shell
passwd root
passwd alarm
```

- Initialize thhe pacman keyring and populate the Arch LInux ARM package signing keys:

```shell
pacman-key --init
pacman-key --populate archlinuxarm
```

-- Start a system upgrade

```shell
pacman -Syyu
```

- Install initial programs

```shell
pacman -S tmux git neovim base-devel sudo zsh zsh-autosuggestions zsh-syntax-highlighting
```

-- Create user, add user to sudoers

```shell
MYUSERNAME='pasi'
useradd -g users -G wheel -s $(which zsh) $MYUSERNAME
mkdir -p /home/$MYUSERNAME
chown $MYUSERNAME:users "/home/$MYUSERNAME"
passwd $MYUSERNAME
visudo
```

- Update system clock and timezone

```shell
timedatectl set-ntp true
ln -sf /usr/share/zoneinfo/Europe/Helsinki /etc/localtime
```

Add required locales to `/etc/locale.gen` file. 

```txt
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
echo "fi_FI.UTF-8 UTF-8" >> /etc/locale.gen
```

- Generate locales, set language and persist keyboard layout

```shell
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "KEYMAP=fi" > /etc/vconsole.conf
```

- Change hostname

```shell
# Change the PIHOSTNAME value as needed.
PIHOSTNAME="afrodite-raspi4"
echo $PIHOSTNAME > /etc/hostname
```

- Add localhost and hostname to `/etc/hosts`

```shell
echo "127.0.0.1     localhost" >> /etc/hosts
echo "::1           localhost" >> /etc/hosts
echo "127.0.1.1     ${PIHOSTNAME}.localdomain    ${PIHOSTNAME}" >> /etc/hosts
```

- Install more tools/programs

```shell
pacman -Sy ack bpytop fd fff fzf htop jq man-db \
    python python-pip ripgrep tig vifm wget
```

- Install Neovim dependencies

```shell
# Change the Node.js version as needed. Must match with the version in the dofiles .zshrc file
NODE_VERSION="14.15.4"

pip3 install pynvim
pip3 install neovim-remote

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh"
source "$NVM_DIR/bash_completion"

nvm install $NODE_VERSION
nvm use $NODE_VERSION
npm install -g npm
npm install -g typescript neovim
```

- Install `yay`

```shell
cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R pasi:users ./yay-git
cd yay-git
makepkg -si
```

- Install .NET (Core) & ASP.NET Core 5x & 3.1 (+ pfetch)

```shell
yay -S netstandard-targeting-pack-bin \
    aspnet-runtime-bin dotnet-host-bin dotnet-runtime-bin \
    dotnet-sdk-3.1 aspnet-runtime-3.1 \
    dotnet-runtime-3.1 dotnet-targeting-pack-3.1 \
    pfetch
```

- Clone dotfiles

```shell
mkdir ~/.cache
mkdir ~/.config
DOTFILES_DIR=".dotfiles"
REPO_URL="git@github.com:PasiBergman/dotfiles.git"
MY_SHELL_RC_FILE=".zshrc"
alias dot='git --git-dir=$HOME/$DOTFILES_DIR/ --work-tree=$HOME'
cd $HOME && echo "$DOTFILES_DIR" >> .gitignore
git clone --bare $REPO_URL $HOME/$DOTFILES_DIR
cd $HOME
dot checkout
```

- Create `.ssh` folder and add `authorized_keys` file with the valid ssh rsa public key:

- On main macOS/main computer:

```shell
cat ~/.ssh/id_rsa.pub | pbcopy
```

- On Arch Linux Arm / Raspberry Pi:

```shell
mkdir ~/.ssh
chmod 700 ~/.ssh
nvim ~/.ssh/authorized_keys
chmod 400 ~/.ssh/authorized_keys
```

- **Test SSH public key login** (i.e. without password) and **after** successful 
login allow only public key authentication and disable ssh root login.

```shell
sudo nvim /etc/ssh/sshd_config
sudo systemctl restart sshd
```

```text
# Do not allow ssh login to root
PermitRootLogin no

# To disable tunneled clear text passwords, change to no here!
PasswordAuthentication no
```

- Remove or change `alarm` account, e.g.

```shell
NEW_USERNAME="<new username>"
sudo usermod -l $NEW_USERNAME alarm
sudo mv /home/alarm /home/$NEW_USERNAME
sudo chown -R ${NEW_USERNAME}:users /home/$NEW_USERNAME
```

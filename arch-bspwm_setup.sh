#!/usr/bin/env bash

# Prerequisites: Install the following fonts manually:
# Hermit
# Overpass (If you like)
# Font Awesome 6 Free

# Installing Yay
pacman -S --needed git base-devel
mkdir ~/Build && cd ~/Build
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Clone Main Repository
cd ~/Build
git clone https://github.com/streamsniperrty/2022-BSPWM-Config.git

# Install BSPWM and SXHKD
sudo pacman -S bspwm sxhkd
mkdir ~/.config/bspwm && mkdir ~/.config/sxhkd
cd ~/Build/2022-BSPWM-Config
cp .config/bspwm/bspwmrc ~/.config/bspwm/ && cp .config/sxhkd/sxhkdrc ~/.config/sxhkd/
sudo chmod +x ~/.config/bspwm/bspwmrc && sudo chmod +x ~/.config/sxhkd/sxhkdrc

# Installing Appearance Utilities
yay -S picom-ibhagwan-git
sudo pacman -S feh polybar libnotify notification-daemon xfce4-notifyd
cp -r .config/picom ~/.config/
cp -r .config/polybar ~/.config/
sudo chmod +x ~/.config/polybar/launch.sh

# Installing Other Applications
cd ..
git clone https://git.suckless.org/dmenu
cd dmenu
rm config.def.h
cp ../2022-BSPWM-Config/Build/config.def.h .
make
sudo make clean install

cd ~/Build/2022-BSPWM-Config
sudo pacman -S alacritty fish
cp -r .config/alacritty ~/.config/
cp -r .config/fish ~/.config/

# Neovim Special Install
sudo pacman -s neovim ctags
cp -r .config/nvim ~/.config/
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

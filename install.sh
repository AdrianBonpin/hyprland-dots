#!/bin/bash

echo "Installing Fish"
sudo pacman -S fish
echo /usr/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/bin/fish

echo "Copy to .config"
cp -r /alacritty ~/.config/
cp -r /dunst ~/.config/
cp -r /fish ~/.config/
cp -r /hypr ~/.config/
cp -r /rofi ~/.config/
cp -r /wlogout ~/.config/

echo "Installing yay"
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si

echo "Install Catppuccin Mocha GTK Theme"
yay -S catppuccin-gtk-theme-mocha

echo "Installing pacman things"
sudo pacman -S fprintd imv ttf-noto-nerd noto-fonts ttf-font-awesome wget --noconfirm

echo "Setting Wallpaper"
mkdir ~/.config/wallpapers
wget https://wallpapercave.com/wp/wp11445346.jpg -O ~/.config/wallpapers/wallpaper-1.jpg

echo "Installing yay things"
yay -S dunst rofi thunderbird unzip neo tlp nwg-look nwg-displays wl-paste eww cliphist hyprpaper iwgtk wlogout blueman pavucontrol hyprpicker grim slurp wpctl brillo brightnessctl microsoft-edge-stable-bin visual-studio-code-bin eza --noconfirm

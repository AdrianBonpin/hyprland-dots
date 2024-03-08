#!/bin/bash

echo "Enter Password Below"
sudo pacman -S fish git alacritty dunst rofi waybar thunderbird unzip nemo tlp tldr nwg-look ttf-noto-nerd noto-fonts ttf-font-awesome --noconfirm
echo "Set to Fish"
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
echo "Copy to .config"
cp -a / ~/.config/
echo "Installing yay"
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si
echo "Installing System Sht"
yay -S wl-paste cliphist hyprpaper iwgtk wlogout blueman pavucontrol hyprpicker grim slurp wpctl brillo brightnessctl microsoft-edge-stable-bin visual-studio-code-bin eza --noconfirm
#!/bin/bash

echo "Install | Fish"
sudo pacman -S fish
echo /usr/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/bin/fish
clear

echo "Install | yay"
sudo pacman -S --noconfirm --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si
clear

echo "Move | Dotfiles"
cp -r dots/{alacritty,dunst,fish,hypr,rofi,wlogout} ~/.config/
clear

echo "Move | Wallpaper"
cp -r wallpapers/ ~/
clear

echo "Folders | Create"
xdg-user-dirs-update
mkdir ~/Pictures/Screenshots
clear

echo "Install | pacman - Tools & Fonts"
sudo pacman -S imv ttf-noto-nerd noto-fonts ttf-font-awesome wget --noconfirm
sudo pacman -S blueman blueman-utils --noconfirm
clear

sudo "Install | pacman - Software"
sudo pacman -S libreoffice obsidian thunderbird obs --noconfirm
clear

echo "Install | yay - Tools & Fonts"
yay -S dunst rofi unzip tlp nwg-look nwg-displays wl-paste eww cliphist hyprpaper iwgtk wlogout pavucontrol hyprpicker grim slurp wpctl brillo brightnessctl  eza --noconfirm
clear

echo "Install | yay - Software"
yay -S microsoft-edge-stable-bin visual-studio-code-bin --noconfirm
clear

echo "Theme | Catppuccin Mocha - GTK, Cursor"
yay -S catppuccin-gtk-theme-mocha catppuccin-cursors-mocha --noconfirm
clear

echo "Theme | Catppuccin Mocha - SDDM"
yay -S qt5-graphicaleffects qt5-svg qt5-quickcontrols2 --noconfirm
git clone https://github.com/catppuccin/sddm.git
sudo cp -r /sddm/src/catppuccin-mocha /usr/share/sddm/themes/
echo "[Theme]
Current=sddm-catppuccin-mocha
" | sudo tee -a /etc/sddm.conf
clear

read -p "Set up Fingerprints? (Y/n): " response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
then
    echo "Install | Fingerprint (fprintd)"
    yay -S fprintd --noconfirm

    echo "Set | Fingerprints"
    sudo fprintd-enroll -f right-thumb
    sudo fprintd-enroll -f right-index-finger
    sudo fprintd-enroll -f right-middle-finger
    clear
fi
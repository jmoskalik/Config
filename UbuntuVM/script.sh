#!/bin/sh

sudo apt-get install vim gpg git neofetch dconf gnome-shell-extensions gnome-tweaks python3 papirus-icon-theme -y &&
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg &&
sudo apt install apt-transport-https &&
sudo apt update &&
sudo apt install code &&
gnome-terminal -- code . &&
gnome-terminal -- gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark" &&
gnome-terminal -- gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark' &&
gnome-terminal -- gsettings set org.gnome.shell.extensions.dash-to-dock show-trash false &&
gnome-terminal -- gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM &&
gnome-terminal -- gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode FIXED &&
gnome-terminal -- gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true && 
gnome-terminal -- gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 1.0 &&
gnome-terminal -- gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 32 &&
gnome-terminal -- gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false &&
cd .config/Code/User/ &&
wget https://raw.githubusercontent.com/xabix99/Config/main/VsCode/settings.json

#!/bin/sh

sudo apt-get install vim gpg git neofetch dconf-editor gnome-shell-extensions software-properties-common apt-transport-https gnome-tweaks python3 -y &&
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add - &&
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" &&
sudo apt install code &&
gnome-terminal -- code . &&
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

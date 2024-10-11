#!/bin/bash
#Install hyprland
yay -S --noconfirm hyprland
# Install necessary packages via pacman
cd $HOME
sudo pacman -S --noconfirm github-cli stow pamixer brightnessctl playerctl ncspot rofi-wayland hyprlock hypridle hyprpaper yazi neofetch bottom networkmanager bluez bluez-utils rustup zsh

# Clone zenities dotfiles
cd $HOME/.config
mv hypr hypr.bak 2>/dev/null
mv kitty kitty.bak 2>/dev/null
cd $HOME/zenities
stow .

# Go back to home directory
cd $HOME

# Install additional packages via yay
yay -S --noconfirm cbonsai cmatrix cava python-pywal ttf-mononoki otf-hermit-nerd gvfs dbus libdbusmenu-glib libdbusmenu-gtk3 gtk-layer-shell zoxide eza fzf thefuck jq socat kitty

# Install Powerlevel10k for zsh
yay -S --noconfirm zsh-theme-powerlevel10k-git
echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc

# Eww installation
cd $HOME
git clone https://github.com/elkowar/eww
cd eww
cargo build --release --no-default-features --features=wayland
cd target/release
chmod +x ./eww
sudo cp ./eww /usr/local/bin/

# Network Manager setup
sudo systemctl disable systemd-resolved
sudo systemctl disable systemd-networkd
sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager

# Change shell to zsh
chsh -s /bin/zsh

echo "Installation complete"
reboot



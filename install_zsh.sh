#!/bin/bash

# Update and upgrade system packages
echo -e "\e[31m[1/10] Updating and upgrading system packages...\e[0m"
apt update -y
apt upgrade -y

# Install required packages
echo -e "\e[31m[2/10] Installing required packages: wget, git, curl, vim, zsh...\e[0m"
apt install wget git curl vim zsh -y

# Download and install MesloLGS NF fonts (commented out)
#echo -e "\e[31m[3/10] Downloading and installing MesloLGS NF fonts...\e[0m"
#wget https://github.com/romkatv/dotfiles-public/raw/master/.local/share/fonts/NerdFonts/MesloLGS%20NF%20Regular.ttf
#wget https://github.com/romkatv/dotfiles-public/raw/master/.local/share/fonts/NerdFonts/MesloLGS%20NF%20Bold.ttf
#wget https://github.com/romkatv/dotfiles-public/raw/master/.local/share/fonts/NerdFonts/MesloLGS%20NF%20Italic.ttf
#wget https://github.com/romkatv/dotfiles-public/raw/master/.local/share/fonts/NerdFonts/MesloLGS%20NF%20Bold%20Italic.ttf

# Install Zsh
echo -e "\e[31m[4/10] Installing Zsh...\e[0m"
apt install zsh -y

# Install Oh My Zsh
echo -e "\e[31m[5/10] Installing Oh My Zsh...\e[0m"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Set Zsh as default shell
echo -e "\e[31m[6/10] Setting Zsh as the default shell...\e[0m"
chsh -s $(which zsh)

# Install PowerLevel10k theme
echo -e "\e[31m[7/10] Installing PowerLevel10k theme...\e[0m"
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# Install plugins
echo -e "\e[31m[8/10] Installing plugins: zsh-autosuggestions, zsh-syntax-highlighting, zsh-z...\e[0m"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z

# Modify .zshrc configuration
echo -e "\e[31m[9/10] Modifying .zshrc configuration...\e[0m"
sed -i 's/^ZSH_THEME=.*$/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
sed -i 's/^plugins=(.*)$/plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-z)/' ~/.zshrc



echo -e "\e[31mNow you can execute zsh on terminal to configure...\e[0m"

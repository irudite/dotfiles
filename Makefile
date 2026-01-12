DPL := echo "y" | sudo pacman -S # Download packages on Arch-based Linux 
DPM := echo "y" | brew install   # Download packages on MacOS
LK := ln -svf                    # Link config directories/files

.PHONY: zsh linux_packages mac_packages yay link

all_linux: zsh linux_packages link
	echo "Finished Linux setup"

all_mac: mac_packages link
	echo "Finished MacOS setup"

zsh:
	echo "---------------------------------------------------------------------"
	echo "Installing zsh..."
	$(DPL) zsh
	chsh -s $(which zsh)
	echo "---------------------------------------------------------------------"

yay:
	git clone https://aur.archlinux.org/yay-bin.git
	cd yay-bin
	makepkg -si

linux_packages: yay
	$(DPL) git base-devel neovim clang cmake gdb yay docker tmux
	$(DPL) nodejs npm jdk-openjdk python-pip
	$(DPL) unzip tree
	$(DPL) discord firefox
	yay -S spotify

mac_packages:
	$(DPM) git neovim gcc cmake clang 
	$(DPM) nodejs npm jdk-openjdk python
	$(DPM) tree
	$(DPM) discord firefox spotify alacritty tmux

link:
	$(LK) ~/dotfiles/nvim ~/.config/nvim
	$(LK) ~/dotfiles/alacritty ~/.config/alacritty
	$(LK) ~/dotfiles/.gitconfig ~/.gitconfig
	$(LK) ~/dotfiles/.tmux.conf ~/.tmux.conf
	$(LK) ~/dotfiles/.zshrc ~/.zshrc

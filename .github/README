
# Arch Linux | Hyprland Rice

A sleek, dynamic, and automated Arch Linux configuration. This setup utilizes Pywal to generate system-wide color schemes on the fly based on the current wallpaper, ensuring visual consistency across all applications.

## System Specifications

- **Operating System:** Arch Linux
- **Window Manager:** Hyprland
- **Shell:** Zsh with Oh My Zsh and Powerlevel10k
- **Terminal Emulator:** Kitty
- **Text Editor:** Neovim (LazyVim distribution)
- **Status Bar:** Waybar (Custom scripts and themes)

## Details

- A wallpaper script run by a keybindthat searches `$HOME/wallpapers` for images displays them via Wofi and auto refreshes the colors for every application. it works with multiple monitors 
- Has custom configs for Kitty, Rofi, Waybar, Hyprland, Hyprlock, CAVA, Neovim and more

## Installation

This repository is managed using the Bare Repository method. Follow the steps below to replicate this configuration on your system.

### 1. Clone the Repository

Clone the repository as a bare repository into a dotfiles directory in your home folder:

```bash
git clone --bare git@github.com:MyCompilerHatesMe/dotfiles.git $HOME/.dotfiles
```

### 2. Define the Configuration Alias

Set up a temporary alias to interact with the bare repository:

```bash
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

### 3. Local Environment Setup

Ensure that untracked files are not displayed when checking the status:

```bash
config config --local status.showUntrackedFiles no
```

### 4. Checkout the Files

Deploy the configuration files to your home directory:

```bash
config checkout
```

**Note:** If this command fails due to existing configuration files, please back up or remove the conflicting files and run the command again.

### 5. Install Dependencies

Install all required system packages using the provided package list:

```bash
sudo pacman -S - < .config/dotfiles/pkglist.txt
```

## License

This project is licensed under the GNU GPL v3. You are free to fork, modify, and customize it to suit your needs.

## Acknowledgments

This setup is built on and inspired by [Eli's Dotfiles](https://github.com/elifouts/Dotfiles)

# Hyprland Setup

Arch Linux setup using this Omarchy Quattro fork.

## 1. Install packages

    sudo pacman -Syu
    sudo pacman -S --needed \
      hyprland uwsm quickshell socat xdg-terminal-exec gum \
      rofi alacritty firefox thunar hyprlock \
      pipewire pipewire-pulse wireplumber libpulse playerctl libnotify \
      networkmanager bluez bluez-utils udiskie \
      xdg-desktop-portal xdg-desktop-portal-hyprland \
      xdg-desktop-portal-gtk grim brightnessctl

Install the Qogir cursor theme:

    yay -S --needed qogir-cursor-theme-git

## 2. Clone

    git clone --branch quattro https://github.com/mtkleet/omarchy.git ~/.local/omarchy
    cd ~/.local/omarchy
    git remote add upstream https://github.com/omacom/omarchy.git

## 3. Configure

    bin/omarchy-setup-hyprland

This deploys the Hyprland configuration and UWSM environment. Existing files are backed up before replacement.

The setup script does not install packages or configure a display manager.

## 4. Start Hyprland

Select the UWSM-managed Hyprland session in your display manager, or run from a TTY:

    uwsm start hyprland.desktop

Verify:

    omarchy-shell shell ping
    hyprctl configerrors

## 5. Update

    omarchy update

The updater fast-forwards the current branch from its configured tracking branch (`origin/quattro`) and updates system packages. It does not automatically merge the official `upstream` remote.

Push local commits to `origin/quattro` before updating. Integrate changes from the official Omarchy repository into this fork separately.

The initial setup records migrations already included in this checkout as a baseline without executing them. Migrations added by subsequent updates run normally.

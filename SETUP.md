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

Omarchy-managed work, projects, downloads, pictures, videos, and AI agent data are stored under `~/.local/omarchyshell`. Compatibility symlinks are used where applications expect conventional paths. The setup does not modify XDG user-directory settings and does not create `Documents` or `Music`.

The setup script does not install packages or configure a display manager.

## 4. Start Hyprland

Select the UWSM-managed Hyprland session in your display manager, or run from a TTY:

    uwsm start hyprland.desktop

Verify:

    omarchy-shell shell ping
    hyprctl configerrors

## 5. Update

Update system packages separately using the distribution's package manager.

Commit and push local changes to `origin/quattro` before pulling updates.

To update this fork:

    cd ~/.local/omarchy
    git pull --ff-only origin quattro
    bin/omarchy-setup-hyprland

Changes from the official Omarchy upstream are not imported automatically. Review and integrate them into this fork separately.

Check newly introduced migrations with `omarchy-migrate --pending` before deciding whether to run them.

The initial setup records migrations already included in this checkout as a baseline without executing them. Migrations introduced by subsequent updates remain pending and should be reviewed separately.

Do not use `omarchy update` with this configuration-only setup. It is intended for a complete Omarchy installation.

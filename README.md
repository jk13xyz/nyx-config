## NYX_CONFIG (Work in Progress)

I'm currently in the process of switching my systems to NixOS. 

This repo is probably far from the textbook example of how one could (or perhaps should) setup their Nix configs, but this is part of the learning process. Most importantly, though, while it works for me right now, this repo is far from finished. It's very rough and barely usable still.

So, bottom line: Use it as inspiration, but don't use it for production.

## CURRENT_SETUP

### NYX_PAD
    Lenovo ThinkPad X1 Nano Gen 2 w/ Core i7-1270p + 16GB RAM
    DE: Hyprland + WM: Wayland
    Shell: zsh + oh-my-zsh + Starship
    OS Version: 23.11-unstable

### NYX_TOP (not yet started)
    Intel i5-8600K + GeForce 1070Ti + 16 GB RAM

### NYX_SERVER (not yet started)
    AMD Ryzen 7 5700G + 64GB RAM

## INSTALL:

    sudo nixos-rebuild switch --flake github:jk13xyz/nyx-config#<SYSTEM> --refresh

## CREDITS/INSPIRATION:

#### NixOS Config/Home Manager

- [github:Misterio77/nix-config](https://github.com/Misterio77/nix-config)
- [github:Misterio77/nix-starter-config](https://github.com/Misterio77/nix-starter-config)
- [gitlab:felschr/nixos-config](https://gitlab.com/felschr/nixos-config)

#### Waybar Config

- [github:vidowner/hyprland-hdready](https://github.com/vidowner/hyprland-hdready)

#### Starship Config

- [Nerd Font Preset](https://starship.rs/presets/nerd-font.html)
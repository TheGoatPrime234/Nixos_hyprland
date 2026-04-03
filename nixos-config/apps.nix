{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # System & Tools
    neovim
    wget
    fastfetch
    git
    tailscale
    pciutils
    pavucontrol
    efibootmgr
    gparted
    zip
    unzip
    syncthing
    nautilus

    # Daily Use
    spotify
    discord
    obsidian
    steam
    vscode

    # Hyprland Setup
    hyprland
    hyprpaper
    hyprlock
    wlogout
    waybar
    grim
    slurp
    wl-clipboard
    swaynotificationcenter
    kitty
    zsh
    rofi
    cava
  ];
}

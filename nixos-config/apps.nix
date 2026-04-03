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

    ## Files
    yazi
    zip
    unzip
    syncthing

    # Daily Use
    spotify
    discord
    obsidian
    steam
    vscode

    # Hyprland Setup
    ## sddm --> pixiesddm
    hyprland
    hyprpaper
    hyprlock
    wlogout
    waybar
    pulsemixer
    spicetify-cli
    grim
    slurp
    wl-clipboard
    swaynotificationcenter
    kitty
    zsh
    rofi
    cava
    playerctl
  ];
}

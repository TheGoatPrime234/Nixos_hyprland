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

    ## Libs
    libnotify

    ## Files
    yazi
    zip
    unzip
    syncthing
    rquickshare

    # Daily Use
    ## spotify --> spicetify
    discord
    obsidian
    steam
    vscode

    # Hyprland Setup
    ## sddm --> pixiesddm
    ## spicetify-cli --> spicetify 
    hyprland
    hyprpaper
    hyprlock
    wlogout
    waybar
    pulsemixer
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

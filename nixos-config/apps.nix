{ config, pkgs }:

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

    # Daily Use
    spotify
    discord
    obsidian
    brave
    steam

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
  ];
}

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

    # Daily Use
    spotify
    discord
    obsidian
    steam
    (pkgs.brave.overrideAttrs (old: {
      version = "1.79.119";
      src = pkgs.fetchurl {
        url = "https://github.com/brave/brave-browser/releases/download/v1.79.119/brave-browser_1.79.119_amd64.deb";
        sha256 = "sha256-8uX8byw/rp+yj6Y2qBemEHGwt4CQepWjVD8F9KuJZbI=";
      };
    }))
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

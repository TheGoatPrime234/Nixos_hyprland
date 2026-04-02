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
    (pkgs.symlinkJoin {
      name = "brave";
      paths = [ pkgs.brave ];
      buildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/brave \
          --add-flags "--password-store=basic"
       '';
    })

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

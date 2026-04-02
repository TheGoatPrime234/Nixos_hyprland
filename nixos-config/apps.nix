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
          --add-flags "--password-store=basic" \
          --add-flags "--disable-gpu-sandbox" \
          --add-flags "--use-gl=desktop" \
          --add-flags "--enable-features=UseOzonePlatform" \
          --add-flags "--ozone-platform=wayland"
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

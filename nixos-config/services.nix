{ config, pkgs, ... }:

{ 
  services = {
    xserver = {
      enable = true;
      videoDrivers = ["nvidia"];
      xkb = {
        layout = "de";
        variant = "";
      };	
    };
    displayManager = {
      sddm = {
        enable = true;
	wayland.enable = true;
      };
      defaultSession = "hyprland";
    };
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
	support32Bit = true;
      };
      pulse.enable = true;
    };
    blueman = {
      enable = true;
    };
    tailscale = {
      enable = true;
    };  
    dbus.enable = true;
    upower.enable = true;
    gnome.gnome-keyring.enable = true;
    printing.enable = true;
  };  
}

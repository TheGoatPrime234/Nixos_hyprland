{ config, pkgs, ... }:

{
  programs = {
    zsh = {
      enable = True;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
    };
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    firefox = {
      enable = true;
    };
  };
}

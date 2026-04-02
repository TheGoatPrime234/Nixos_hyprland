{ config, pkgs, ... }:

{
  programs = {
    zsh = {
      enable = true;
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

{ config, pkgs, ...}: 

{
  fonts.packages = [
    pkgs.nerd-fonts.geist-mono
  ];
}

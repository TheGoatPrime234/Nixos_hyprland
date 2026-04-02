{ config, pkgs, ...}: 

{
  fonts.packages = [
    pkgs.nerdfonts.geist-mono
  ];
}

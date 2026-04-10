{ config, pkgs, ... }:

{ 
  programs.nixvim = {
    enable = true;

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 4;
    };

#    colorschemes.catppuccin.enable = true;
    colorschemes.everforest.enable = true;
    colorschemes.everforest.autoLoad = true;

    plugins = {
      lualine.enable = true;
      treesitter.enable = true;
    };
  };
}

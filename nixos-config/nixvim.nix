{ config, pkgs, ... }:

{ 
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    opts = {
      number = true;
      relativenumber = true;
      termguicolors = true;
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

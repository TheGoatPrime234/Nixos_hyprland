{ config, pkgs, ... }:

{
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        nvidia-vaapi-driver
      ];
    };
    nvidia = {
      open = true;
      modesetting = {
        enable = true;
      };
      powerManagement = {
        enable = true;
      };
      prime = {
        sync = {
	  enable = true;
	};
	intelBusId = "PCI:0:2:0";
	nvidiaBusId = "PCI:1:0:0";
      };	
    };
  };
}  


{ config, pkgs, ... }:

{
  imports = [
    ./desktop.nix
  ];

  home.packages = with pkgs; [
    waybar
    wofi
    sway
    grim
    wl-clipboard
    xorg.xeyes
    waybar
    gammastep
    ghostty
  ];

  wayland.windowManager.sway = {
    enable = true;
  };

  home.pointerCursor.sway.enable = true;

  gtk = {
    enable = true;
    theme = {
      name = "Layan-Dark-Solid";
      package = pkgs.layan-gtk-theme;
    };
    
    iconTheme = {
      name = "Flat-Remix-Cyan-Dark";
      package = pkgs.flat-remix-icon-theme;
    };
  };
}

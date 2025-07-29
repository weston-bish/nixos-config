{ config, pkgs, ... }:

{
  imports = [
    ../common.nix
  ];

  home.username = "westonb";
  home.homeDirectory = "/home/westonb";

  home.packages = with pkgs; [
    brave
    btop
    libreoffice
    gimp
    qbittorrent
    mpv
    pavucontrol
    xdg-user-dirs
    kdePackages.kdenlive
    sxiv
    lf
    xfce.thunar
    obs-studio
    audacity
  ];

  home.pointerCursor = {
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    size = 24;
    x11 = {
      enable = true;
      defaultCursor = "Adwaita";
    };
  };
}

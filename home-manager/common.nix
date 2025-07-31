{ config, pkgs, ... }:

{
  home.stateVersion = "25.05";

  home.username = "westonb";
  home.homeDirectory = "/home/westonb";

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      # put aliases here
    };

    history.size = 10000;
    history.ignoreAllDups = true;
    history.path = "${config.xdg.dataHome}/zsh/history";
    history.ignorePatterns = ["rm *" "pkill *" "cp *"];
  };

  programs.starship = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userName = "weston-bish";
    userEmail = "digah2750@gmail.com";
  };

  home.pointerCursor = {
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    size = 24;
    x11 = {
      enable = true;
      defaultCursor = "Adwaita";
    };
    sway.enable = true;
  };

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

  home.file."${config.xdg.configHome}" = {
    source = ../dotfiles;
    recursive = true;
  };

  home.packages = with pkgs; [
    neovim
    fastfetch
    htop
    unzip
    wget
    curl
    git
    tmux
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
    waybar
    wofi
    sway
    grim
    wl-clipboard
    xorg.xeyes
    gammastep
    ghostty
    brightnessctl
  ];

  programs.home-manager.enable = true;
}

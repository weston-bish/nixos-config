{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./modules/tmux-config.nix
    ./modules/neovim-config.nix
  ];

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
    audacity
    bat
    brave
    brightnessctl
    btop
    curl
    fastfetch
    gammastep
    ghostty
    gimp
    git
    grim
    htop
    kdePackages.kdenlive
    lf
    libreoffice
    mpv
    neovim
    obs-studio
    pavucontrol
    prismlauncher
    qbittorrent
    sway
    sxiv
    unzip
    waybar
    wget
    wl-clipboard
    wofi
    xdg-user-dirs
    xfce.thunar
    xorg.xeyes
  ];

  programs.home-manager.enable = true;
}

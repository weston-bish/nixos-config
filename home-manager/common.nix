{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./modules/tmux-config.nix
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
      ls = "eza --icons=always";
      ll = "eza -la --icons=always";
      up = "cd ..";

      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      gl = "git log --oneline --graph --decorate";
      gco = "git checkout";
      gb = "git branch";
      gd = "git diff";
      gpull = "git pull --rebase";
      gcl = "git clone";
      gr = "git restore";
      grh = "git reset HEAD";

      vim = "nvim";
      vi = "nvim";

      update = "sudo nixos-rebuild switch";

      myip = "curl ifconfig.me";

      rm = "rm -i";
      cp = "cp -i";
      mv = "mv -i";

      tree = "tree -C";
      
      please = "sudo";
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
    delta
    discord
    eza
    fastfetch
    fd
    fzf
    gammastep
    gcc
    ghostty
    gimp
    git
    gnumake
    grim
    htop
    jq
    kdePackages.kdenlive
    lazygit
    libreoffice
    mpv
    neovim
    obs-studio
    pavucontrol
    pkg-config
    prismlauncher
    qbittorrent
    ripgrep
    sway
    sxiv
    tree
    unzip
    waybar
    wget
    wl-clipboard
    wofi
    xdg-user-dirs
    xfce.thunar
    xorg.xeyes
    yazi
  ];

  programs.home-manager.enable = true;
}

{ config, pkgs, ... }:

{
  home.stateVersion = "25.05";

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
  ];

  programs.home-manager.enable = true;
}

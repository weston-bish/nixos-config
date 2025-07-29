{ config, pkgs, ... };

{
  home.stateVersion = "25.05";



  home.packages = with pkgs; [
    neovim
    fastfetch
    htop
    unzip
    wget
    curl
    git
    tmux
  ]
}

= Nix Configuration
- NixOS Desktop
- Nix Darwin for Mac
- Custom Neovim, Tmux, Shell config

you need to put 'source ~/.config/tmux/config' in `~/.tmux.conf` for this to work

CLI apps go into common.nix
Linux GUI apps and Linux-only apps go into nixos/home.nix
Mac GUI apps and Mac-only apps are installed via homebrew through mac/configuration.nix

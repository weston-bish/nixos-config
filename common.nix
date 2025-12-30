{ config, pkgs, ... }:

{
	programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;

		shellAliases = {
# put aliases here
			ls = "eza --icons=always";

			myip = "curl ifconfig.me";

			rm = "rm -i";
			cp = "cp -i";
			mv = "mv -i";

			tree = "tree -C";
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
		settings.user = {
			name = "weston-bish";
			email = "digah2750@gmail.com";
		};
	};

	home.packages = with pkgs; [
		bat
			curl
			eza
			fastfetch
			fd
			fzf
			htop
			jq
			lazygit
			mpv
			neovim
			newsboat
			ripgrep
			tmux
			tree
			typst
			unzip
			wget
			yazi
			yt-dlp
	];


	home.stateVersion = "25.11";

	programs.home-manager.enable = true;
}

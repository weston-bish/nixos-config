{ config, pkgs, ... }:

{
	nix = {
		gc = {
			automatic = true;
			dates = "weekly";
			options = "--delete-older-than 30d";
		};

		optimise.automatic = true;
	};

	users.users.weston.shell = pkgs.zsh;

	fonts.packages = with pkgs; [
		nerd-fonts.jetbrains-mono
			nerd-fonts.symbols-only
			noto-fonts
			noto-fonts-cjk-sans
			noto-fonts-color-emoji
			liberation_ttf
			dejavu_fonts
	];

	programs.zsh.enable = true;

	environment.variables = {
		EDITOR = "nvim";
		VISUAL = "nvim";
		XDG_SESSION_TYPE = "wayland";
		XDG_CURRENT_DESKTOP = "sway";
	};

	xdg.portal = {
		enable = true;
		xdgOpenUsePortal = true;
		wlr.enable = true;
		config = {
			common = {
				default = [ "wlr" ];
			};
			sway = {
				default = [ "wlr" ];
			};
		};
	};

	services.displayManager.sessionPackages = with pkgs; [
		sway
	];

}

{ config, pkgs, ... }:

{
	imports =
		[
		../common.nix
		];


# Home Manager needs a bit of information about you and the
# paths it should manage.
		home.username = "weston";
	home.homeDirectory = "/Users/weston";

	home.file."${config.xdg.configHome}" = {
		source = ../dotfiles;
		recursive = true;
		force = true;
	};
}

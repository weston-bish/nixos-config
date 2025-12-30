{ config, pkgs, ... }:

{
# Home Manager needs a bit of information about you and the
# paths it should manage.
	imports =
	[
		../common.nix
	];

	home.username = "weston";
	home.homeDirectory = "/home/weston";

	home.file."${config.xdg.configHome}" = {
		source = ../dotfiles;
		recursive = true;
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

	wayland.windowManager.sway = {
		enable = true;
		wrapperFeatures.gtk = true; # Fixes common issues with GTK 3 apps
	};

	# only gui and linux-only apps go here, cli go in common
	home.packages = with pkgs; [
		audacity
			gammastep # linux only
			ghostty
			gimp
			grim
			inkscape
			kdePackages.kdenlive
			keepassxc
			libreoffice
			mullvad-browser
			nicotine-plus
			obs-studio
			pavucontrol
			qbittorrent
			sxiv # linux only
			ungoogled-chromium
			vlc
			waybar
			wl-clipboard
			wofi
			xorg.xeyes
			];



# This value determines the Home Manager release that your
# configuration is compatible with. This helps avoid breakage
# when a new Home Manager release introduces backwards
# incompatible changes.
}

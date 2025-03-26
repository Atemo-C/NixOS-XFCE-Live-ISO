# Custom NixOS XFCE Live ISO, with some of the tools I use.
{ config, ... }: { imports = [

	# Uses the current channel to build the ISO.
	<nixpkgs/nixos/modules/installer/cd-dvd/channel.nix>

	# Imports a customized version of the graphical base module.
	# Original: <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-grapihcal-base.nix>
	./graphical-base.nix

	# Adds the Calamares installer, but does not autostart it.
	# Note that it does not offer to install this live session: Only the defaults provided by NixOS.
	# Original module: <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-graphical-calamares.nix>
#	./calamares.nix # Currently disabled since, for some reason, no settings is provided by default.

	# Imports the main configuration file.
	./configuration.nix

]; }

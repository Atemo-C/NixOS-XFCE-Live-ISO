{ pkgs, ... }:
let
	calamares-nixos-autostart = pkgs.makeAutostartItem {
		name = "io.calamares.calamares";
		package = pkgs.calamares-nixos;
	};
in
{
	imports = [ ./graphical-base.nix ];

	environment.systemPackages = [
		# Calamares installer for a graphical installation.
		pkgs.calamares-nixos
		pkgs.calamares-nixos-extensions

		# QT depedency for Calamares.
		pkgs.libsForQt5.kpmcore

		# To get a list of all locales.
		pkgs.glibcLocales
	];

	# Support choosing from any locale.
	i18n.supportedLocales = [ "all" ];

	# If on Wayland, fix the scaling.
	environment.variables = {
		QT_QPA_PLATFORM = "$([[ $XDG_SESSION_TYPE = \"wayland\" ]] && echo \"wayland\")";
	};

}

{ pkgs, ... }: {

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

}

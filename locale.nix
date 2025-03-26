{ config, ... }: { i18n = {

	# Sets the default locale.
	defaultLocale = "en_US.UTF-8";

	# Sets specific settings for certain locale elements.
	extraLocaleSettings = {
		LC_ADDRESS = "fr_FR.UTF-8";
		LC_IDENTIFICATION = "fr_FR.UTF-8";
		LC_MEASUREMENT = "fr_FR.UTF-8";
		LC_MONETARY = "fr_FR.UTF-8";
		LC_NAME = "fr_FR.UTF-8";
		LC_NUMERIC = "fr_FR.UTF-8";
		LC_PAPER = "fr_FR.UTF-8";
		LC_TELEPHONE = "fr_FR.UTF-8";
		LC_TIME = "en_GB.UTF-8";
	};

};}

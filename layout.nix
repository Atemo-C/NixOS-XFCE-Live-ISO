{ config, ... }: {

	# Keyboard layout to use in the Linux console (TTY).
#	console.keyMap = "fr";
	console.keyMap = "us-acentos";

	# Keyboard layout to use in the graphical environment.
	services.xserver.xkb = {
#		layout = "fr";
		layout = "us";
		variant = "intl";
	};

}

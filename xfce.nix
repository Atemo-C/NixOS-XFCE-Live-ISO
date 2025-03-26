{ config, pkgs, ... }: {

	services = {
		# Enables the XFCE desktop environment.
		xserver.desktopManager.xfce.enable = true;
		displayManager.defaultSession = "xfce";

		# Enables auto-login for XFCE.
		displayManager.autoLogin = {
			enable = true;
			user = "nixos";
		};

		# Disable XTerm since XFCE's terminal is already present.
		xserver.desktopManager.xterm.enable = false;
		xserver.excludePackages = [ pkgs.xterm ];
	};

	# Excludes some XFCE packages that are replaced by ones I personally use.
	environment.xfce.excludePackages = [
		pkgs.xfce.parole
	];

	# Enables presentation mode, so that the display never locks itself.
	# This is because it is not possible to get past the lock screen without a password set for the user.
	home-manager.users.nixos.xfconf.settings.xfce4-power-manager = { "xfce4-power-manager/presentation-mode" = true; };

}

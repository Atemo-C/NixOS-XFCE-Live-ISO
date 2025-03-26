{ pkgs, ... }: { environment.systemPackages = [

	# Terminal-based fetching program.
	pkgs.fastfetch

	# Terminal-bsaed system monitor.
	pkgs.btop

	# A neater ls command.
	pkgs.lsd

	# The MPV media player.
	pkgs.mpv

	# Some image utilities.
	pkgs.imagemagick
	pkgs.jpegoptim
	pkgs.oxipng
	pkgs.libjxl
	pkgs.libwebp

	# A calculator.
	pkgs.galculator

	# A password manager.
	pkgs.keepassxc

	# An office suite.
	pkgs.libreoffice-fresh

	# Additional shell utilities.
	pkgs.bat
	pkgs.dash
	pkgs.wget
	pkgs.tlrc
	pkgs.parallel

	# Timeshift system restore utilitiy.
	pkgs.timeshift

	# Clonezilla…still does not exist in nixpkgs. Huh.
#	pkgs.clonezilla

]; }

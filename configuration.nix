# Main configuration file.
# This imports various modules that you may wish to toggle or edit yourself.
{ ... }: { imports = [

	# Proprietary NVIDIA GPU drivers; Only for 16XX and above.
#	./nvidia.nix

	# Some GPU tools for Intel and AMD users.
	./gputools.nix

	# Home Manager setup.
	./home-manager.nix

	# Basic system theming.
	./theming.nix

	# XFCE.
	./xfce.nix

	# XFCE panel configuration.
	./xfce-panel.nix

	# Default keyboard layout.
	./layout.nix

	# Default locale.
	./locale.nix

	# Default time zone.
	./time.nix

	# Power saving with TLP.
	./powersaving.nix

	# Allow running appimages.
	./appimages.nix

	# Add additional programs.
	./programs.nix

	# FISH shell.
	./fish.nix

]; }

# Main configuration file.
# This imports various modules that you may wish to toggle or edit yourself.
{ ... }: { imports = [

	# Specialization for proprietary NVIDIA GPU drivers; Only for 16XX and above.
	# No need to disable it: You can choose to boot with or without them.
	./nvidia.nix

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

	# Temporary module to apply fixes.
	./temporary.nix

]; }

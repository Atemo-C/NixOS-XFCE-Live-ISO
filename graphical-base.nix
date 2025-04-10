{ config, lib, pkgs, ... }: {

	# Imports the installation CD base module.
	imports = [ <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-base.nix> ];

	# Enables the plymouth splash screen on boot. Needed (for some dumb reason) to start Lightdm…?
	boot.plymouth.enable = true;

	# Allows users in the wheel group to do anything, for convenience.
	# This should absolutely not be done outside of this live environment.
	security.polkit.extraConfig = ''
		polkit.addRule(function(action, subject) {
			if (subject.isInGroup("wheel")) {
				return polkit.Result.YES;
			}
		});
	'';

	# Enables the X server & Lightdm display manager.
	services.xserver.enable = true;

	# Provide NetworkManager for easy network configuration.
	networking.networkmanager.enable = true;

	# Disable the useless wait-online sub-service of NetworkManager.
	systemd.services.NetworkManager-wait-online.enable = false;

	# Let DHCPCD start in the background, improving boot times.
	networking.dhcpcd.wait = "background";

	# Disable wpa_supplicant via wireless.enable.
	networking.wireless.enable = false;

	# Optional virtual machine guest additions for QEMU/KVM, VMware Workstation, etc.
	services.spice-vdagentd.enable = true;
	services.qemuGuest.enable = true;
#	virtualisation.vmware.guest.enable = pkgs.stdenv.hostPlatform.isx86;
#	virtualisation.hypervGuest.enable = true;
#	services.xe-guest-utilities.enable = pkgs.stdenv.hostPlatform.isx86;

	# The VirtualBox guest additions rely on an out-of-tree kernel module which lags behind kernel releases.
	# Can potentially causing broken builds.
#	virtualisation.virtualbox.guest.enable = true;

	# Add a set of basic utilities for the graphical environment.
	environment.defaultPackages = [
		# Gparted for partitioning disks.
		pkgs.gparted

		# A reasonable terminal-based text editor.
		# XFCE's text editor is also installed by default.
		pkgs.micro

		# A web browser.
		pkgs.librewolf

		# The Tor browser, just in case.
		pkgs.tor-browser
	];

	# Disable the nano text editor, since micro is being used.
	programs.nano.enable = false;

	# Use a more recent version of the Linux Kernel to support more hardware OOTB.
#	boot.kernelPackages = pkgs.linuxPackages_latest;

	# Allow installation of unfree software.
	nixpkgs.config.allowUnfree = true;

	# Enable graphics acceleration.
	hardware.graphics = {
		enable = true;
		enable32Bit = true;
	};

	# Enables full audio support through PipeWire.
	services.pipewire = {
		enable = true;
		alsa = {
			enable = true;
			support32Bit = true;
		};
		jack.enable = true;
		pulse.enable = true;
	};

	# Makes the Linux console (TTY) have more readable and bright colors.
	console = {
		earlySetup = true;
		colors = [
			"000000" # Black
			"ff0000" # Red
			"00ff00" # Green
			"ffc000" # Yellow
			"0080ff" # Blue
			"ff00ff" # Magenta
			"00ffff" # Cyan
			"dddddd" # White
			"333333" # Bright black
			"ff4d4d" # Bright red
			"80ff80" # Bright green
			"ffd966" # Bright yellow
			"66b3ff" # Bright blue
			"ff66ff" # Bright magenta
			"80ffff" # Bright cyan
			"ffffff" # Bright white
		];
	};

}

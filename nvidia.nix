{ config, pkgs, ... }: {

	# Make resuming more stable in some situations with an NVIDIA GPU.
	boot.kernelParams = [ "nvidia.NVreg_PreserveVideoMemoryAllocations=1" ];

	hardware.nvidia = {
		# Whether to enable Dynamic Boost.
		# It balances power between the CPU and the GPU for improved peformance on supported laptops.
		dynamicBoost.enable = false;

		# Whether to enable kernel modesetting when using the proprietary NVIDIA driver.
		# Enabling it fixes screen tearing when using Optimus via PRIME.
		# It can also cause Wayland compositors to work when they otherwise wouldn't.
		modesetting.enable = true;

		# Whether to enable the open source NVIDIA kernel module.
		# Should probably be disabled on versions prior to the 560 drivers.
		open = true;

		# The NVIDIA driver package to use.
		package = config.boot.kernelPackages.nvidiaPackages.beta;

		# Whether to enable experimental power management through systemd.
		powerManagement.enable = true;
	};

	# Use the proprietary NVIDIA drivers.
	services.xserver.videoDrivers = [ "nvidia" ];

}

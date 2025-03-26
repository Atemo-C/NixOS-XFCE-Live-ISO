{ config, pkgs, ... }: { hardware.graphics.extraPackages = [

	# Enabling OpenCL for compatible AMD GPUs.
	pkgs.rocmPackages.clr.icd

	# Enabling OpenCL for comptaible Intel GPUs.
	pkgs.intel-compute-runtime

	# VA-API for modern Intel GPUs.
	pkgs.intel-media-driver

	# VA-API for older Intel GPUs.
	pkgs.intel-vaapi-driver

]; }

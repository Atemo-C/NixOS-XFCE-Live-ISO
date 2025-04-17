![image](https://github.com/Atemo-C/NixOS-XFCE-Live-ISO/blob/main/Desktop.webp)

# [1] General information.
These are a collection of Nix modules that allows one to create a live ISO of a NixOS unstable system with the XFCE desktop environment. \
It contains certain tools that I use, excludes some that I do not, and is even themed appropriately (with a black-and-blue theme for the live user, and a black-and-red theme for the root user). \
The way it is structured is somewhat similar, though not identical, to my main [NixOS configuration](https://github.com/Atemo-C/NixOS-configuration).

# [2] To do before building the ISO.

## [2.1] NixOS unstable (unstable nixpkgs).
This has only been tested on NixOS unstable system. Support for NixOS stable has not been tested, and nothing is guaranteed to work for them.

## [2.2] NVIDIA.
If you have an NVIDIA GPU from the 16XX series and above, uncomment the `./nvidia` import in `configuration.nix`, and you should also feel free to comment out the `./gputools` import in `configuration.nix`.

## [2.3] Virtual machines.
Support for QEMU/KVM guests is enabled by default in the `graphical-base.nix` module. It can be disabled, and guest additions for other hypervisors can be enabled. Note that XFCE does not seem to support automatic resizing out of the box, but the proper screen resolutions should still be available in XFCE's Display settings.

## [2.4] Verification of the Nix modules.
You might wish to check every Nix module present here, and modify them to fit your own needs.

# [3] Building the ISO.
1. Open a terminal emulator.
2. Execute the following command:
```
sudo nix-build '<nixpkgs/nixos>' -A config.system.build.isoImage -I nixos-config=/path/to/ISO.nix
```
3. Wait.
4. The ISO file will be located in the `results/iso/` symlink.

## [3.1] Neater.
You may use different flags to make the output neater, more or less verbose, etc. I personally use the following:
```
sudo nix-build '<nixpkgs/nixos>' -A config.system.build.isoImage -I nixos-config=/path/to/ISO.nix --quiet --log-format bar-with-logs
```

## [3.2] Cleaning up remains.
Once you have moved/copied the ISO and wish to get rid of the built image and its dependencies, you must:
1. Find the full path of the symlink (e.g. `/nix/store/…-nixos-XX.XXbeta…-x86_64-linux.iso`).
2. Open a terminal emulator.
3. Execute the following command:
```
sudo nix-store --delete --ignore-liveness /nix/store…-nixos-XX.XXbeta…-x86_64-linux.iso
```

# [4] Additional notes.
- Calamares is currently not provided, as I, for now, cannot figure out how to include NixOS's own settings to it.
- Even if it were, I have no prior experience working with Calamares, and thus do not know how to make this live session installable.
- This is purely a live environment, useful for very basic rescue operations, program usage on the go, as well as installing NixOS *manually* on other devices. Of course, you may feel free to change it to fit your own needs.

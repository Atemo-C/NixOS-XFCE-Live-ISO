{ config, pkgs, ... }: {

	# Tell Adwaita-based programs to prefer a dark theme.
	environment.sessionVariables = { ADW_DEBUG_COLOR_SCHEME = "prefer-dark"; };

	# Set nicer default fonts for the desktop.
	fonts = {
		# Whether to install a basic set of fonts providing several styles and families.
		# It also provides a reasonable coverage of Unicode.
		enableDefaultPackages = true;

		# Whether to create a directory with links to all fonts in /run/current-system/sw/share/X11/fonts.
		fontDir.enable = true;

		fontconfig = {
			# Whether to generate system fonts cache for 32-bit applications.
			cache32Bit = true;

			# Default fonts to use, per category.
			# Multiple fonts may be listed in case one does not support certain characters, such as emojis.
			defaultFonts = {
				# Default emoji font(s).
				emoji = [ "Noto Color Emoji" ];

				# Default monospace font(s).
				monospace = [ "UbuntuMono Nerd Font" "Noto Color Emoji" ];

				# Default Sans-Serif font(s).
				sansSerif = [ "Ubuntu Nerd Font" "Noto Color Emoji" ];

				# Default Serif font(s).
				serif = [ "Ubuntu Nerd Font" "Noto Color Emoji" ];
			};
		};

		# List of primary font packages.
		packages = [
			# Ubuntu Nerd Fonts.
			pkgs.nerd-fonts.ubuntu
			pkgs.nerd-fonts.ubuntu-mono

			# Noto Fonts and emojis.
			pkgs.noto-fonts
			pkgs.noto-fonts-cjk-sans
			pkgs.noto-fonts-color-emoji
		];
	};

	# Theming for the live user.
	home-manager.users.nixos = {
		gtk = {
			# Whether to enable GTK 2/3 configuration.
			enable = true;

			cursorTheme = {
				# Package providing the cursor theme.
				package = pkgs.bibata-cursors;

				# The name of the cursor theme within the package.
				name = "Bibata-Modern-Ice";

				# The size of the cursor.
				size = 24;
			};

			iconTheme = {
				# Package providing the icon theme.
				package = pkgs.flat-remix-icon-theme;

				# The name of the icon theme within the package.
				name = "Flat-Remix-Blue-Dark";
			};

			theme = {
				# Package providing the theme.
				package = pkgs.flat-remix-gtk;

				# The name of the theme to use within the package.
				name = "Flat-Remix-GTK-Blue-Darkest-Solid";
			};

			# Extra configuration lines to add verbatim to ~/.gtkrc-2.0.
			gtk2.extraConfig = "
				gtk-primary-button-wraps-slider = 1
				gtk-toolbar-style = 3
				gtk-menu-images = 1
				gtk-button-images = 1
				gtk-enable-mnemonics = 0
			";

			# Extra configuration options to add to $XDG_CONFIG_HOME/gtk-3.0/settings.ini.
			gtk3.extraConfig = {
				gtk-application-prefer-dark-theme = true;
				gtk-button-images = true;
				gtk-menu-images = true;
				gtk-toolbar-style = 3;
			};
		};

		home.pointerCursor = {
			# Whether to enable gtk config generation for home.pointerCursor .
			gtk.enable = true;

			# Package providing the cursor theme.
			package = pkgs.bibata-cursors;

			# The cursor name within the package.
			name = "Bibata-Modern-Ice";

			# The cursor size.
			size = 24;
		};

		qt = {
			# Whether to enable Qt configuration.
			enable = true;

			# Style to use for Qt applications.
			style.name = "gtk2";
		};

		# XFCE settings.
		xfconf.settings = {
			xsettings = {
				"Gtk/MonospaceFontName" = "UbuntuMono Nerd Font 11";
				"Gtk/FontName" = "Ubuntu Nerd Font 10";
				"Net/IconThemeName" = "Flat-Remix-Blue-Dark";
				"Net/ThemeName" = "Flat-Remix-GTK-Blue-Darkest-Solid";
			};
			xfwm4 = { "general/theme" = "Flat-Remix-Darkest-XFWM"; };
			xfce4-power-manager = {
				"lid-action-on-ac" = 1;
				"lock-screen-suspend-hibernate" = false;
			};
			xfce4-desktop = { "desktop-icons/style" = 1; };
		};
	};

	# Theming for the root user (gparted etc).
	home-manager.users.root = {
		gtk = {
			# Whether to enable GTK 2/3 configuration.
			enable = true;

			cursorTheme = {
				# Package providing the cursor theme.
				package = pkgs.bibata-cursors;

				# The name of the cursor theme within the package.
				name = "Bibata-Modern-Ice";

				# The size of the cursor.
				size = 24;
			};

			iconTheme = {
				# Package providing the icon theme.
				package = pkgs.flat-remix-icon-theme;

				# The name of the icon theme within the package.
				name = "Flat-Remix-Red-Dark";
			};

			theme = {
				# Package providing the theme.
				package = pkgs.flat-remix-gtk;

				# The name of the theme to use within the package.
				name = "Flat-Remix-GTK-Red-Darkest-Solid";
			};

			# Extra configuration lines to add verbatim to ~/.gtkrc-2.0.
			gtk2.extraConfig = "
				gtk-primary-button-wraps-slider = 1
				gtk-toolbar-style = 3
				gtk-menu-images = 1
				gtk-button-images = 1
				gtk-enable-mnemonics = 0
			";

			# Extra configuration options to add to $XDG_CONFIG_HOME/gtk-3.0/settings.ini.
			gtk3.extraConfig = {
				gtk-application-prefer-dark-theme = true;
				gtk-button-images = true;
				gtk-menu-images = true;
				gtk-toolbar-style = 3;
			};
		};

		home.pointerCursor = {
			# Whether to enable gtk config generation for home.pointerCursor .
			gtk.enable = true;

			# Package providing the cursor theme.
			package = pkgs.bibata-cursors;

			# The cursor name within the package.
			name = "Bibata-Modern-Ice";

			# The cursor size.
			size = 24;
		};

		qt = {
			# Whether to enable Qt configuration.
			enable = true;

			# Style to use for Qt applications.
			style.name = "gtk2";
		};

		# XFCE settings.
		xfconf.settings = {
			xsettings = {
				"Gtk/MonospaceFontName" = "UbuntuMono Nerd Font 11";
				"Gtk/FontName" = "Ubuntu Nerd Font 10";
				"Net/IconThemeName" = "Flat-Remix-Blue-Dark";
				"Net/ThemeName" = "Flat-Remix-GTK-Blue-Darkest-Solid";
			};
			xfwm4 = { "general/theme" = "Flat-Remix-Darkest-XFWM"; };
			xfce4-power-manager = {
				"lid-action-on-ac" = 1;
				"lock-screen-suspend-hibernate" = false;
			};
			xfce4-desktop = { "desktop-icons/style" = 1; };
		};
	};

	qt = {
		# Whether to enable Qt configuration, including theming.
		enable = true;

		# Selects the platform theme to use for Qt applications.
		platformTheme = "gtk2";

		# Selects the style to use for Qt applications.
		style = "gtk2";
	};

}

#! /bin/bash

adding_casper() {
	CASPER_DEPS_PKGS='
		casper/trixie
		initramfs-tools/trixie
		initramfs-tools-bin/trixie
		initramfs-tools-core/trixie
	'

	install_downgrades $CASPER_DEPS_PKGS

	#	Hold initramfs and casper packages.

	INITRAMFS_CASPER_PKGS='
		casper
		initramfs-tools
		initramfs-tools-core
		initramfs-tools-bin
	'

	hold $INITRAMFS_CASPER_PKGS
}

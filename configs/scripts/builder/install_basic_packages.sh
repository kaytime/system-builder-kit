#! /bin/bash

install_basic_packages() {
	CHROOT_BASIC_PKGS='
		apt-transport-https
		apt-utils
		appstream
		axel
		ca-certificates
		curl
		dhcpcd5
		dirmngr
		gnupg2
		libzstd-dev
		lz4
		zstd
	'

	update
	install $CHROOT_BASIC_PKGS
}

#! /bin/bash

adding_bootloader() {
	GRUB2_PKGS='
		grub-common/trixie
		grub-efi-amd64/trixie
		grub-efi-amd64-bin/trixie
		grub-efi-amd64-signed/trixie
		grub-pc-bin/trixie
		grub2-common/trixie
		libfreetype6/unstable
	'

	install $GRUB2_PKGS
}

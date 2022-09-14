#! /bin/bash

adding_system_bootscreen() {
	BOOTSCREEN_PKGS='
		system-bootscreen
	'

	update
	install $BOOTSCREEN_PKGS
}

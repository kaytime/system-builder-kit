#! /bin/bash

adding_open_rc() {
	OPENRC_INIT_PKGS='
	initscripts
	init-system-helpers
	openrc
	policycoreutils
	startpar
	sysvinit-utils
'

	install $OPENRC_INIT_PKGS
}

#! /bin/bash

adding_devuan_and_elogind() {
    DEVUAN_EUDEV_ELOGIND_PKGS='
	eudev
	elogind
'

    REMOVE_SYSTEMD_PKGS='
	systemd
	systemd-sysv
	libsystemd0
'

    SYSTEMCTL_STANDALONE_PKG='
	systemctl
'

    install $DEVUAN_EUDEV_ELOGIND_PKGS
    purge $REMOVE_SYSTEMD_PKGS
    autoremove
    install $SYSTEMCTL_STANDALONE_PKG

    rm \
        /etc/apt/sources.list.d/devuan-beowulf-repo.list

    remove_repo_keys \
        541922FB \
        61FC752C >/dev/null

    update
}

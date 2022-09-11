#! /bin/bash

adding_policykit_elogind() {
    add_repo_keys \
        541922FB \
        61FC752C >/dev/null

    cp /builder/configs/files/sources.list.devuan.beowulf /etc/apt/sources.list.d/devuan-beowulf-repo.list

    update

    DEVUAN_POLKIT_PKGS='
	libpam-elogind/beowulf
	libpolkit-agent-1-0/beowulf
	libpolkit-backend-elogind-1-0/beowulf
	libpolkit-gobject-1-0/beowulf
	libpolkit-gobject-elogind-1-0/beowulf
	policykit-1/beowulf
'

    install_downgrades $DEVUAN_POLKIT_PKGS

    rm \
        /etc/apt/sources.list.d/devuan-beowulf-repo.list

    remove_repo_keys \
        541922FB \
        61FC752C >/dev/null

    update
}

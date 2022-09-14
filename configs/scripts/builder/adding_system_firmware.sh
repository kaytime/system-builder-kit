#! /bin/bash

adding_system_firmware() {
    add_repo_keys \
        86F7D09EE734E623 >/dev/null

    cp /configs/files/sources.list.xanmod /etc/apt/sources.list.d/xanmod-repo.list

    update

    MAINLINE_KERNEL_PKG='
	linux-image-xanmod-edge
	libcrypt-dev/trixie
	libcrypt1/trixie
'

    install_downgrades $MAINLINE_KERNEL_PKG

    rm \
        /etc/apt/sources.list.d/xanmod-repo.list

    remove_repo_keys \
        86F7D09EE734E623 >/dev/null

    update
}

#! /bin/bash

adding_plymouth() {
    add_repo_keys \
        541922FB \
        61FC752C >/dev/null

    cp /builder/configs/files/sources.list.devuan.daedalus /etc/apt/sources.list.d/devuan-daedalus-repo.list

    update

    DEVUAN_PLYMOUTH_PKGS='
        plymouth/daedalus
        plymouth-label/daedalus
        plymouth-x11/daedalus
    '

    install $DEVUAN_PLYMOUTH_PKGS

    rm \
        /etc/apt/sources.list.d/devuan-daedalus-repo.list

    remove_repo_keys \
        541922FB \
        61FC752C >/dev/null

    update
}

#! /bin/bash

adding_devuan_misc_packages() {
    add_repo_keys \
        541922FB \
        61FC752C >/dev/null

    cp /builder/configs/files/sources.list.devuan.daedalus /etc/apt/sources.list.d/devuan-daedalus-repo.list

    update

    MISC_DEVUAN_DAEDALUS_PKGS='
        network-manager/daedalus
    '

    install $MISC_DEVUAN_DAEDALUS_PKGS

    rm \
        /etc/apt/sources.list.d/devuan-daedalus-repo.list

    remove_repo_keys \
        541922FB \
        61FC752C >/dev/null

    update
}

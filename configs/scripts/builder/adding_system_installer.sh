#! /bin/bash

adding_system_installer() {
    add_repo_keys \
        55751E5D >/dev/null

    cp /configs/files/sources.list.neon.user /etc/apt/sources.list.d/neon-user-repo.list

    update

    CALAMARES_PKGS='
        efibootmgr
        calamares
        calamares-qml-settings-kaytime
        dosfstools
        squashfs-tools
    '

    install $CALAMARES_PKGS

    rm \
        /etc/apt/sources.list.d/neon-user-repo.list

    remove_repo_keys \
        55751E5D >/dev/null

    update
}

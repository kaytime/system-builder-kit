#! /bin/bash

adding_sources_file() {
    cp /builder/configs/files/sources.list.kaytime /etc/apt/sources.list
    cp /builder/configs/files/sources.list.kaytime.$BUILD_CHANNEL /etc/apt/sources.list.d/kaytime-$BUILD_CHANNEL-repo.list
    cp /builder/configs/files/sources.list.debian.experimental /etc/apt/sources.list.d/debian-experimental-repo.list
    cp /builder/configs/files/sources.list.debian.unstable /etc/apt/sources.list.d/debian-unstable-repo.list

    apt-key export EB1BEB0D | gpg --dearmour -o /usr/share/keyrings/kaytime-$BUILD_CHANNEL.gpg
    apt-key export 712260DE | gpg --dearmour -o /usr/share/keyrings/kaytime-compat.gpg

    update
}

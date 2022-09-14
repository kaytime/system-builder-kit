#! /bin/bash

# Switch
while :; do
    case $BUILD_CHANNEL in
    stable)
        BUILD_CHANNEL_APT_KEY=4A55608C12F2450A
        break
        ;;
    unstable)
        BUILD_CHANNEL_APT_KEY=7007CC7088E6C947
        break
        ;;
    testing)
        BUILD_CHANNEL_APT_KEY=77E96358060ABB1F
        break
        ;;
    *)
        echo "This channel is not supported."
        break
        ;;
    esac
done

adding_sources_file() {
    cp configs/files/sources.list.kaytime /etc/apt/sources.list
    cp configs/files/sources.list.kaytime.$BUILD_CHANNEL /etc/apt/sources.list.d/kaytime-$BUILD_CHANNEL-repo.list
    cp configs/files/sources.list.debian.experimental /etc/apt/sources.list.d/debian-experimental-repo.list
    cp configs/files/sources.list.debian.unstable /etc/apt/sources.list.d/debian-unstable-repo.list

    apt-key export $BUILD_CHANNEL_APT_KEY | gpg --dearmour -o /usr/share/keyrings/kaytime-$BUILD_CHANNEL.gpg
    apt-key export 176991DF5EA0105E | gpg --dearmour -o /usr/share/keyrings/kaytime-compat.gpg

    update
}

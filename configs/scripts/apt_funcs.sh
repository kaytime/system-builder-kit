#! /bin/bash

#	Wrap APT commands in functions.

add_kaytime_key_repo() { curl -L https://packagecloud.io/kaytime/repo/gpgkey | apt-key add -; }
add_kaytime_key_compat() { curl -L https://packagecloud.io/kaytime/compat/gpgkey | apt-key add -; }
add_kaytime_key_stable() { curl -L https://packagecloud.io/kaytime/stable/gpgkey | apt-key add -; }
add_kaytime_key_unstable() { curl -L https://packagecloud.io/kaytime/unstable/gpgkey | apt-key add -; }
add_kaytime_key_testing() { curl -L https://packagecloud.io/kaytime/testing/gpgkey | apt-key add -; }
add_repo_keys() { apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $@; }
appstream_refresh_force() { appstreamcli refresh --force; }
autoremove() { apt -yy autoremove $@; }
clean_all() { apt clean && apt autoclean; }
dist_upgrade() { apt -yy dist-upgrade $@; }
download() { apt download $@; }
dpkg_force_install() { dpkg --force-all -i $@; }
dpkg_force_remove() { /usr/bin/dpkg --remove --no-triggers --force-remove-essential --force-bad-path $@; }
dpkg_install() { dpkg -i $@; }
fix_install() { apt -yy --fix-broken install $@; }
fix_install_no_recommends() { apt -yy --fix-broken install --no-install-recommends $@; }
hold() { apt-mark hold $@; }
install() { apt -yy install --no-install-recommends $@; }
install_downgrades() { apt -yy install --no-install-recommends --allow-downgrades $@; }
install_downgrades_hold() { apt -yy install --no-install-recommends --allow-downgrades --allow-change-held-packages $@; }
install_force_overwrite() { apt -yy install --no-install-recommends -o Dpkg::Options::="--force-overwrite" $@; }
install_hold() { apt -yy install --no-install-recommends $@ && apt-mark hold $@; }
list_installed_apt() { apt list --installed; }
list_installed_dpkg() { dpkg --list '*'; }
list_installed_pkgs() { dpkg-query -l | less >installed_pkgs.txt; }
list_number_pkgs() { dpkg-query -f '${binary:Package}\n' -W | wc -l; }
list_pkgs_size() { dpkg-query --show --showformat='${Installed-Size}\t${Package}\n' | sort -rh | head -25 | awk '{print $1/1024, $2}'; }
list_upgrade() { apt list --upgradable; }
only_upgrade() { apt -yy install --no-install-recommends --only-upgrade $@; }
only_upgrade_force_overwrite() { apt -yy install --no-install-recommends --only-upgrade -o Dpkg::Options::="--force-overwrite" $@; }
pkg_policy() { apt-cache policy $@; }
pkg_search() { apt-cache search $@; }
purge() { apt -yy purge --remove $@; }
remove_repo_keys() { apt-key del $@; }
unhold() { apt-mark unhold $@; }
update() { apt update; }
update_quiet() { apt -qq update; }
upgrade() { apt -yy upgrade $@; }
upgrade_downgrades() { apt -yy upgrade --allow-downgrades $@; }

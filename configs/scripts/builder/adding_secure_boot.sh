#! /bin/bash

adding_secure_boot() {
    SB_SHIM_PKGS='
	sbsigntool/trixie
	shim-signed/trixie
	mokutil/trixie
'

    install $SB_SHIM_PKGS
}

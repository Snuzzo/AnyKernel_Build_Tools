#!/bin/bash -e

. snuzzo-build-config

make    \
        ARCH=arm \
        CROSS_COMPILE="$CROSS_COMPILE" \
	$*

#!/usr/bin/env sh

set -xue

where=${1}
shift

store=${1}
shift

mkdir -p ${where}

exec unshare -r -U -m setcwd ${PWD} jail0 ${where} ${store} chroot ${where} setcwd ${PWD} ${@}

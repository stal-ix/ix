#!/usr/bin/env sh
set -xue
OLDPATH=${PATH}
export PATH=${PATH}:/ix/realm/system/bin
store=${1}
shift
mount -t tmpfs tmpfs ${store}/build
mkdir ${store}/build/trash
mount --bind ${store}/build/trash ${store}/trash
exec env PATH=${OLDPATH} "${@}"

#!/usr/bin/env sh
set -xue
store=${1}
shift
mount -t tmpfs tmpfs ${store}/build
mkdir ${store}/build/trash
mount --bind ${store}/build/trash ${store}/trash
exec ${@}

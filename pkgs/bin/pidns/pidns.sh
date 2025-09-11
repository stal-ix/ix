#!/usr/bin/env sh

exec unshare -U -f -r -m -p pidns_chroot "${@}"

#!/usr/bin/env sh

exec unshare -f -m -p --mount-proc ${@}

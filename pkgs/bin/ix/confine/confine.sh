#!/bin/sh
set -xue
OLDPATH=${PATH}
export PATH=${PATH}:/ix/realm/system/bin
exec unshare -r -U -m jail /sys /ix env PATH=${OLDPATH} "${@}"

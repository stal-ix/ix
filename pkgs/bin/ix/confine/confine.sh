#!/bin/sh
set -xue
OLDPATH=${PATH}
export PATH=${PATH}:/ix/realm/system/bin
where=${1}
shift
exec unshare -r -U -m jail /sys ${where} env PATH=${OLDPATH} "${@}"

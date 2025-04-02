#!/usr/bin/env sh
set -xue
OLDPATH=${PATH}
export PATH=${PATH}:/ix/realm/system/bin
exec jail /sys /ix env PATH=${OLDPATH} "${@}"

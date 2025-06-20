#!/usr/bin/env sh

set -ue

cd "${IX_DIR}/pkgs"

find -type f -name ix.sh \
    | grep -v '/t/' \
    | sed -e 's|^./||' -e 's|/ix.sh||' \
    | grep -v '^die/' \
    | grep -v '^bld/' \
    | grep '/'

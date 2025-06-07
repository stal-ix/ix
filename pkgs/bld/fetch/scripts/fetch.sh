#!/usr/bin/env sh

set -xue

export PATH="${PATH}:/bin:/ix/realm/system/bin"

exec fetcher "${1}" "$(basename ${1})" "${2}"

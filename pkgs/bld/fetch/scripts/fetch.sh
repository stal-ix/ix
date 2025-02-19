#!/usr/bin/env sh

set -xue

export PATH="${PATH}:/bin"

exec fetcher "${1}" "$(basename ${1})" "__skip__"

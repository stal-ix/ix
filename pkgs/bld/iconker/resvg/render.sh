#!/usr/bin/env sh

set -xue

exec resvg -w 192 -h 192 "${1}" "${2}"

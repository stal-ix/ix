#!/usr/bin/env sh

set -ue

exec clang-19 -isystem$(dirname $(dirname $(command -v clang-19)))/share/include "${@}"

#!/usr/bin/env sh

set -xue

mv "${1}" /ix/trash/ || rm -rf "${1}"

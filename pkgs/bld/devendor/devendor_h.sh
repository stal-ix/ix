#!/usr/bin/env sh

set -xue

cd "${1}"

find . -type f -name '*.h' -delete
find . -type f -name '*.hh' -delete
find . -type f -name '*.hpp' -delete

#!/usr/bin/env sh

set -xue

export PATH=/bin:${PATH}

exec fetcher ${1} $(basename ${1}) "__skip__"

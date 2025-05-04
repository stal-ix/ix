#!/usr/bin/env sh

set -xue

exec rsync -a --exclude=touch ${1}/ ${2}/

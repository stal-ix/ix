#!/usr/bin/env sh

set -xue

xmllint - | sed \
    -e 's|name="pid_t"|name="gint"|' \
    -e 's|name="uid_t"|name="guint"|' \
    -e 's|filename="build/.*/src/||' \
    | xmllint -

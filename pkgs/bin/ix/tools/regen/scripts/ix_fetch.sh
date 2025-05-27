#!/usr/bin/env sh

set -xue

(
ssh root@lab1.nebula 'cat /var/run/ci/binlist'
ssh root@lab2.nebula 'cat /var/run/ci/binlist'
ssh root@lab3.nebula 'cat /var/run/ci/binlist'
) | grep '\->' | awk '{print $9" "$11}' | sed -e 's| .*-bin-| bin-|'

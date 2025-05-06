#!/usr/bin/env sh

set -xue

IX_EXEC_KIND=fake IX_DUMP_REPO=1 ./ix build set/ci --seed=1 | ix_repo | sort | uniq | ix_flt | sort | uniq | grep -v nlua0 > pkgs/die/scripts/dump.json

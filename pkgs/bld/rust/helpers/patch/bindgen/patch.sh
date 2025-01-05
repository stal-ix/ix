#!/usr/bin/env sh

set -xue

sed -e 's|"runtime"|"static"|' \
    -i ${1}/bindgen/Cargo.toml

sed -e 's|"runtime"|"static"|' \
    -i ${1}/clang-sys/Cargo.toml

cat << EOF > ${1}/clang-sys/build/static.rs
pub fn link() {
}
EOF

#!/usr/bin/env sh

set -xue

sed -e 's|"runtime"|"static"|' \
    -i bindgen/Cargo.toml

sed -e 's|"runtime"|"static"|' \
    -i vendored/clang-sys/Cargo.toml

cat << EOF > vendored/clang-sys/build/static.rs
pub fn link() {
}
EOF

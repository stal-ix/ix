set -ue

exec clang-18 \
    -Wno-unused-command-line-argument \
    -fuse-ld=lld \
    -isystem$(dirname $(dirname $(command -v clang-18)))/share/include \
    "${@}" \
    ${YA_C_FLAGS}

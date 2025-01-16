set -ue

exec ${FREESTANDING_CLANG} \
    -Wno-unused-command-line-argument \
    -fuse-ld=lld \
    -isystem${CLANG_HEADERS} \
    "${@}" \
    ${YA_C_FLAGS}

# url https://opensource.apple.com/tarballs/patch_cmds/patch_cmds-17.tar.gz
# md5 4740086061c91069efcfbf4fde458ead
# dep boot/stage/1/heirloom boot/stage/0/env

build() {
    $untar $src/patch* && cd patch* && cd patch

    mkdir -p $out/bin
    clang $CPPFLAGS $CFLAGS $LDFLAGS *.c -o $out/bin/patch
}

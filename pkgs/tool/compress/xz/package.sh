# bld lib/xz env/tools

build() {
    cd $out && cp -R $(dirname $(which xz)) ./
}

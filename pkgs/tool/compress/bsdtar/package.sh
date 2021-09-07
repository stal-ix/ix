# dep lib/archive env/tools

build() {
    cd $out && cp -R $(dirname $(which bsdtar)) ./
}

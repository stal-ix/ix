# bld lib/bzip2 env/tools

build() {
    cd ${out} && cp -R $(dirname $(which bzip2)) ./
}

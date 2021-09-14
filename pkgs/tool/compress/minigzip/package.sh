# bld lib/z boot/final/env/tools

build() {
    mkdir ${out}/bin && cd ${out}/bin && cp $(which minigzip) minigzip
}

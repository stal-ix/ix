# dep lib/z boot/final/env

build() {
    mkdir $out/bin && cd $out/bin && cp $(which minigzip) minigzip
}

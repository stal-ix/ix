# dep lib/curl env/std

build() {
    cd $out && cp -R $(dirname $(which curl)) ./
}

# url https://github.com/ninja-build/ninja/archive/refs/tags/v1.10.2.tar.gz
# md5 639f75bc2e3b19ab893eaf2c810d4eb4
# dep lib/cxx dev/lang/python3 env/std

build() {
    $untar $src/v* && cd ninja*

    setup_compiler
    python3 ./configure.py --bootstrap
    mkdir -p $out/bin && cp ninja $out/bin/
}

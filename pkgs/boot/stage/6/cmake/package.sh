# lib env/cmake
# bld {{'boot/lib/linux' | linux}} boot/lib/cxx boot/stage/5/env
# run boot/stage/6/samurai
{% include '//util/fetch_cmake.sh' %}

build() {
    $untar $src/cmake* && cd cmake*

    setup_compiler

    export CPPFLAGS=
    export LDFLAGS=
    export CFLAGS=
    export CXXFLAGS=

    build_cmake_ps

    dash ./bootstrap --prefix=$out --parallel=$make_thrs -- -DCMAKE_USE_OPENSSL=OFF -Dfortran=OFF -DBUILD_TESTING=OFF
    make -j $make_thrs
    make install
}

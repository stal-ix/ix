# lib dev/build/samurai
# dep lib/z lib/xz lib/uv lib/cxx lib/curl lib/bzip2 lib/expat lib/archive
# dep boot/final/cmake boot/final/pkg-config env/std
# run env/cmake
{% include '//util/fetch_cmake.sh' %}

build() {
    $untar $src/cmake* && cd cmake*

    build_cmake_ninja \
        -Dfortran=OFF \
        -DBUILD_TESTING=OFF \
        -DCMAKE_USE_SYSTEM_CURL=ON \
        -DCMAKE_USE_SYSTEM_BZIP2=ON \
        -DCMAKE_USE_SYSTEM_LIBLZMA=ON \
        ..
}

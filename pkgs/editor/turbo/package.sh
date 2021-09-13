# url https://github.com/magiblot/turbo/archive/971aad35d4b705228caa8852114438ee71d488d8.zip
# md5 53d2cdb6a47cad1796d32dc5839726e8
# bld lib/cxx lib/fmt lib/tvision lib/clipboard dev/build/cmake env/std

build() {
    $unzip ${src}/*.zip && cd turbo*

    echo 'install(TARGETS turbo DESTINATION bin)' >> CMakeLists.txt

    export CPPFLAGS="-I$tool_gnu_file/include ${CPPFLAGS}"

    build_cmake_ninja \
        -DTURBO_USE_SYSTEM_DEPS=ON \
        -DTURBO_USE_SYSTEM_TVISION=ON \
        ..
}

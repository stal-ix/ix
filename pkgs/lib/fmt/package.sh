# url https://github.com/fmtlib/fmt/archive/refs/tags/7.1.3.tar.gz
# md5 2522ec65070c0bda0ca288677ded2831
# lib lib/cxx
# bld dev/build/cmake env/std

build() {
    $untar $src/*.gz && cd fmt*

    build_cmake_ninja ..

    cat << EOF > $out/env
export CPPFLAGS="-I$out/include \$CPPFLAGS"
export LDFLAGS="-L$out/lib -lfmt \$LDFLAGS"
export PKG_CONFIG_PATH="$out/lib/pkgconfig:\$PKG_CONFIG_PATH"
export CMFLAGS="-Dfmt_INCLUDE_DIR=$out/include -Dfmt_LIBRARY=$out/lib/libfmt.a \$CMFLAGS"
EOF
}

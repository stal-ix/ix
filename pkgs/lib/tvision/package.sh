# url https://github.com/magiblot/tvision/archive/c36e190174463ece471bdd1c06959fb8dc343c3c.zip
# md5 9c20bbe1511fe6d8b470f528467e2f27
# lib lib/cxx lib/ncurses
# bld dev/build/cmake env/std

build() {
    $unzip ${src}/*.zip && cd tvision*

    setup_compiler

    build_cmake_ninja ..

    cat << EOF > ${out}/env
export CPPFLAGS="-I${out}/include \${CPPFLAGS}"
export LDFLAGS="-L${out}/lib -ltvision \${LDFLAGS}"
EOF
}

setup_compiler() {
    cat << EOF > clang
#!$(command -v dash)
$(command -v clang) ${CPPFLAGS} ${CFLAGS} ${CONLYFLAGS} -Wno-unused-command-line-argument "\$@" ${LDFLAGS}
EOF

    cat << EOF > clang++
#!$(command -v dash)
$(command -v clang++) ${CPPFLAGS} ${CFLAGS} ${CONLYFLAGS} ${CXXFLAGS} -Wno-unused-command-line-argument "\$@" ${LDFLAGS}
EOF

    cat << EOF > cpp
#!$(command -v dash)
$(command -v clang-cpp) ${CPPFLAGS} "\$@"
EOF

    chmod +x clang clang++ cpp

    ln -s clang gcc
    ln -s clang c99
    ln -s clang cc

    ln -s clang++ g++
    ln -s clang++ c++

    ln -s "$(command -v llvm-ar)" ar
    ln -s "$(command -v llvm-ranlib)" ranlib
    ln -s "$(command -v llvm-nm)" nm

    export LDFLAGS=
    export LIBS=
    export AR="$(command -v ar)"
    export RANLIB="$(command -v ranlib)"
    export CC="$(command -v clang)"
    export CXX="$(command -v clang++)"
    export CFLAGS=
    export CPPFLAGS=
    export CXXFLAGS=
    export CONLYFLAGS=
}

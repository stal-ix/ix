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
$(command -v cpp) ${CPPFLAGS} "\$@"
EOF

    chmod +x clang clang++ cpp

    ln -s clang gcc
    ln -s clang c99
    ln -s clang cc

    ln -s clang++ g++
    ln -s clang++ c++

    export LDFLAGS=
    export LIBS=
    export CC=$(command -v clang)
    export CXX=$(command -v clang++)
    export CFLAGS=
    export CPPFLAGS=
    export CXXFLAGS=
    export CONLYFLAGS=
}

setup_compiler() {
    cat << EOF > clang
#!$(which dash)
$(which clang) ${CPPFLAGS} ${CFLAGS} $CONLYFLAGS -Wno-unused-command-line-argument "\$@" ${LDFLAGS}
EOF

    cat << EOF > clang++
#!$(which dash)
$(which clang++) ${CPPFLAGS} ${CFLAGS} ${CONLYFLAGS} ${CXXFLAGS} -Wno-unused-command-line-argument "\$@" ${LDFLAGS}
EOF

    chmod +x clang clang++

    cp clang gcc
    cp clang c99
    cp clang cc

    cp clang++ g++
    cp clang++ c++

    export PATH="$(pwd):${PATH}"
    export CC=$(which clang)
    export CXX=$(which clang++)
}

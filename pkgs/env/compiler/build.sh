setup_compiler() {
    cat << EOF > clang
#!$(which dash)
$(which clang) ${CPPFLAGS} ${CFLAGS} $CONLYFLAGS -Wno-unused-command-line-argument "\$@" ${LDFLAGS}
EOF

    cat << EOF > clang++
#!$(which dash)
$(which clang++) ${CPPFLAGS} ${CFLAGS} ${CXXFLAGS} -Wno-unused-command-line-argument "\$@" ${LDFLAGS}
EOF

    chmod +x clang clang++

    ln -s clang gcc
    ln -s clang c99
    ln -s clang cc

    ln -s clang++ g++
    ln -s clang++ c++

    export PATH="$(pwd):${PATH}"
    export CC=$(which clang)
    export CXX=$(which clang++)
}

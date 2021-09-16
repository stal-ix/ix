setup_compiler() {
    cat << EOF > clang
#!$(which dash)
$(which clang) ${CPPFLAGS} ${CFLAGS} $CONLYFLAGS -Wno-unused-command-line-argument "\$@" ${LDFLAGS}
EOF

    cat << EOF > clang++
#!$(which dash)
$(which clang++) ${CPPFLAGS} ${CFLAGS} ${CONLYFLAGS} ${CXXFLAGS} -Wno-unused-command-line-argument "\$@" ${LDFLAGS}
EOF

    cat << EOF > cpp
#!$(which dash)
$(which cpp) ${CPPFLAGS} "\$@"
EOF

    chmod +x clang clang++ cpp

    ln -s clang gcc
    ln -s clang c99
    ln -s clang cc

    ln -s clang++ g++
    ln -s clang++ c++

    export PATH="$(pwd):${PATH}"
    export CC=$(which clang)
    export CXX=$(which clang++)
}

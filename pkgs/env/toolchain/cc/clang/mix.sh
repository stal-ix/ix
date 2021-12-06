{% extends '//mix/template/py.py' %}

{% block env %}
export CLANG_LTO=""
export CLANG_TARGET="--target={{target.arch}}-{{target.vendor}}-{{target.os}}"
export CPPFLAGS="${CLANG_LTO} -Wno-unused-command-line-argument -nostdinc -nostdinc++ ${CLANG_TARGET} ${CPPFLAGS}"
export CFLAGS="${CLANG_LTO} -fcolor-diagnostics ${CFLAGS}"
export CXXFLAGS="${CLANG_LTO} -fcolor-diagnostics -Wno-stdlibcxx-not-found ${CXXFLAGS}"
export LDFLAGS="${CLANG_LTO} -nostdlib++ -fcolor-diagnostics ${CLANG_TARGET} ${LDFLAGS}"

setup_compiler() {
    cat << EOF > clang
#!$(which dash)
$(which clang) ${CPPFLAGS} ${CFLAGS} ${CONLYFLAGS} "\$@" ${LDFLAGS}
EOF

    cat << EOF > clang++
#!$(which dash)
$(which clang++) ${CPPFLAGS} ${CFLAGS} ${CONLYFLAGS} ${CXXFLAGS} "\$@" ${LDFLAGS}
EOF

    cat << EOF > cpp
#!$(which dash)
$(which clang-cpp) ${CPPFLAGS} "\$@"
EOF

    chmod +x clang clang++ cpp

    ln -s clang gcc
    ln -s clang c99
    ln -s clang cc

    ln -s clang++ g++
    ln -s clang++ c++

    export CC=clang
    export CXX=clang++
}
{% endblock %}

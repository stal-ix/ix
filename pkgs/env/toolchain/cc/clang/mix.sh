{% extends '//mix/template/py.py' %}

{% block env %}
export CLANG_LTO=""
export CLANG_TARGET="--target={{mix.platform.target.arch}}-{{mix.platform.target.vendor}}-{{mix.platform.target.os}}"
export CPPFLAGS="${CLANG_LTO} -nostdinc -nostdinc++ ${CLANG_TARGET} ${CPPFLAGS}"
export CFLAGS="${CLANG_LTO} -fcolor-diagnostics ${CFLAGS}"
export CXXFLAGS="${CLANG_LTO} -fcolor-diagnostics -Wno-stdlibcxx-not-found ${CXXFLAGS}"
export LDFLAGS="${CLANG_LTO} -nostdlib++ -fcolor-diagnostics ${CLANG_TARGET} ${LDFLAGS}"

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

    export CC=clang
    export CXX=clang++
}
{% endblock %}

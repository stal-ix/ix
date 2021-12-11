{% extends '//mix/template/py.py' %}

{% block env %}
export CLANG_TARGET="--target={{target.arch}}-{{target.vendor}}-{{target.os}}"
export CPPFLAGS="-Wno-unused-command-line-argument -nostdinc -nostdinc++ ${CLANG_TARGET} ${CPPFLAGS}"
export CFLAGS="-fcolor-diagnostics ${CFLAGS}"
export CXXFLAGS="-fcolor-diagnostics -Wno-stdlibcxx-not-found ${CXXFLAGS}"
export LDFLAGS="-nostdlib++ -fcolor-diagnostics ${CLANG_TARGET} ${LDFLAGS}"

setup_compiler() {
    cat << EOF > clang
#!$(which dash)
$(which clang) ${OPTFLAGS} ${CPPFLAGS} ${CFLAGS} ${CONLYFLAGS} "\$@" ${LDFLAGS} ${OPTFLAGS}
EOF

    cat << EOF > clang++
#!$(which dash)
$(which clang++) ${OPTFLAGS} ${CPPFLAGS} ${CFLAGS} ${CONLYFLAGS} ${CXXFLAGS} "\$@" ${LDFLAGS} ${OPTFLAGS}
EOF

    cat << EOF > cpp
#!$(which dash)
$(which clang-cpp) ${OPTFLAGS} ${CPPFLAGS} "\$@" ${OPTFLAGS}
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

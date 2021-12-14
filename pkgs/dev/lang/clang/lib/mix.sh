{% extends '//mix/template/py.py' %}

{% block lib_deps %}
env/toolchain/ar/llvm/mix.sh
env/toolchain/ld/lld/mix.sh
lib/build/mix.sh
{% endblock %}

{% block env %}
setup_compiler_env() {
    export CC=clang
    export CXX=clang++
}

setup_compiler() {
setup_compiler_env

B="--target={{target.arch}}-{{target.vendor}}-{{target.os}} -fcolor-diagnostics -Wno-unused-command-line-argument -nostdinc -nostdinc++ ${OPTFLAGS} ${CPPFLAGS} ${CFLAGS}"
E="-nostdlib++ ${LDFLAGS} ${OPTFLAGS}"

cat << EOF > clang
#!$(which dash)
exec "$(which clang)" ${B} ${CONLYFLAGS} "\$@" ${E}
EOF

cat << EOF > clang++
#!$(which dash)
exec "$(which clang++)" ${B} -Wno-stdlibcxx-not-found ${CXXFLAGS} "\$@" ${E}
EOF

cat << EOF > cpp
#!$(which dash)
exec "$(which clang-cpp)" ${B} "\$@" ${OPTFLAGS}
EOF

chmod +x clang clang++ cpp

ln -s clang gcc
ln -s clang c99
ln -s clang cc

ln -s clang++ g++
ln -s clang++ c++
}

setup_toolchain_env() {
    setup_compiler_env
    setup_ar_env
}

setup_toolchain() {
    setup_compiler
    setup_ar

    export LDFLAGS=
    export CFLAGS=
    export CPPFLAGS=
    export CXXFLAGS=
    export CONLYFLAGS=
}
{% endblock %}

{% extends '//mix/template/py.py' %}

{% block env %}
setup_compiler() {
export CC=clang
export CXX=clang++

L="-nostdlib -nostdlib++ ${LDFLAGS}"
C="--target={{target.arch}}-{{target.vendor}}-{{target.os}} -fcolor-diagnostics -Wno-unused-command-line-argument -nostdinc -nostdinc++ ${CPPFLAGS} ${CFLAGS} ${OPTFLAGS}"

cat << EOF > cc
#!$(which dash)
exec "$(which clang)" ${C} "\$@" ${CONLYFLAGS} ${L} ${C}
EOF

cat << EOF > c++
#!$(which dash)
exec "$(which clang++)" ${C} "\$@" -Wno-stdlibcxx-not-found ${CXXFLAGS} ${L} ${C}
EOF

cat << EOF > preproc
#!$(which dash)
exec "$(which clang-cpp)" ${C} "\$@" ${C}
EOF

chmod +x cc c++ preproc
}
{% endblock %}

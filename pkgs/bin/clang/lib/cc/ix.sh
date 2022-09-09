{% extends '//die/py.py' %}

{% block env %}
setup_compiler() {
export CC=clang
export CXX=clang++
export OBJC=clang

L="-nostdlib -nostdlib++ ${LDFLAGS}"
C="--target={{target.arch}}-{{target.vendor}}-{{target.os}} -fcolor-diagnostics -nostdinc -nostdinc++ ${CPPFLAGS} ${CFLAGS} ${OPTFLAGS}"
C="${C} -Wno-deprecated -Wno-implicit-int -Wno-int-conversion -Wno-unused-command-line-argument"
LC="${C} ${CTRFLAGS}"

cat << EOF > cc
#!$(which sh)
exec "$(which clang)" ${LC} "\$@" ${CONLYFLAGS} ${L} ${C}
EOF

cat << EOF > c++
#!$(which sh)
exec "$(which clang++)" ${LC} "\$@" -Wno-stdlibcxx-not-found ${CXXFLAGS} ${L} ${C}
EOF

cat << EOF > preproc
#!$(which sh)
exec "$(which clang-cpp)" ${LC} "\$@" ${C}
EOF

chmod +x cc c++ preproc
}
{% endblock %}

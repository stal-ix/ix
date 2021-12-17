{% extends '//mix/template/py.py' %}

{% block env %}
setup_compiler() {
export CC=clang
export CXX=clang++

C="--target={{target.arch}}-{{target.vendor}}-{{target.os}} -fcolor-diagnostics -Wno-unused-command-line-argument -nostdinc -nostdinc++ ${CPPFLAGS} ${CFLAGS} -nostdlib -nostdlib++ ${LDFLAGS} ${OPTFLAGS}"

cat << EOF > cc
#!$(which dash)
exec "$(which clang)" ${C} "\$@" ${CONLYFLAGS} ${C}
EOF

cat << EOF > c++
#!$(which dash)
exec "$(which clang++)" ${C} "\$@" -Wno-stdlibcxx-not-found ${CXXFLAGS} ${C}
EOF

cat << EOF > preproc
#!$(which dash)
exec "$(which clang-cpp)" ${C} "\$@" ${C}
EOF

chmod +x cc c++ preproc
}
{% endblock %}

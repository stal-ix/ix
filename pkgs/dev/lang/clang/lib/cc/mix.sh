{% extends '//mix/template/py.py' %}

{% block env %}
setup_compiler() {
export CC=clang
export CXX=clang++

B="--target={{target.arch}}-{{target.vendor}}-{{target.os}} -fcolor-diagnostics -Wno-unused-command-line-argument -nostdinc -nostdinc++ ${OPTFLAGS} ${CPPFLAGS} ${CFLAGS}"
E="-nostdlib++ ${LDFLAGS} ${OPTFLAGS}"

cat << EOF > cc
#!$(which dash)
exec "$(which clang)" ${B} ${CONLYFLAGS} "\$@" ${E}
EOF

cat << EOF > c++
#!$(which dash)
exec "$(which clang++)" ${B} -Wno-stdlibcxx-not-found ${CXXFLAGS} "\$@" ${E}
EOF

cat << EOF > preproc
#!$(which dash)
exec "$(which clang-cpp)" ${B} "\$@" ${OPTFLAGS}
EOF

chmod +x cc c++ preproc
}
{% endblock %}

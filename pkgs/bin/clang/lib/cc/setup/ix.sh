{% extends '//die/env.sh' %}

{% block env %}
setup_compiler() {
L="${LDFLAGS}"
C="--target={{target.arch}}-{{target.vendor}}-{{target.clang_os}} ${CPPFLAGS} ${CFLAGS}"
LC="${CTRFLAGS}"

cat << EOF > cc
#!$(which sh)
export tmp=${tmp}
export PATH=${PATH}
export SELF=${PWD}/cc
exec wrapcc clang ${LC} "\${@}" ${CONLYFLAGS} ${L} ${C}
EOF

cat << EOF > c++
#!$(which sh)
export tmp=${tmp}
export PATH=${PATH}
export SELF=${PWD}/c++
exec wrapcc clang++ ${LC} "\${@}" ${CXXFLAGS} ${L} ${C}
EOF

cat << EOF > preproc
#!$(which sh)
export tmp=${tmp}
export PATH=${PATH}
export SELF=${PWD}/preproc
exec wrapcc clang-cpp ${LC} "\${@}" ${C}
EOF

chmod +x cc c++ preproc
}
{% endblock %}

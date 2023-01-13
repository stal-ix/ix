{% extends '//die/env.sh' %}

{% block env %}
setup_compiler() {
L="${LDFLAGS}"
C="--target={{target.arch}}-{{target.vendor}}-{{target.os}} ${CPPFLAGS} ${CFLAGS} ${OPTFLAGS}"
LC="${C} ${CTRFLAGS}"

cat << EOF > cc
#!$(which sh)
exec "$(which clang)" ${LC} "\${@}" ${CONLYFLAGS} ${L} ${C}
EOF

cat << EOF > c++
#!$(which sh)
exec "$(which clang++)" ${LC} "\${@}" ${CXXFLAGS} ${L} ${C}
EOF

cat << EOF > preproc
#!$(which sh)
exec "$(which clang-cpp)" ${LC} "\${@}" ${C}
EOF

chmod +x cc c++ preproc
}
{% endblock %}

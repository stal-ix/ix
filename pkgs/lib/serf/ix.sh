{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://github.com/apache/serf/archive/refs/tags/1.3.9.tar.gz
sha:ebeb4904692e68469de7fdedf99f1fc102d3fc922c9bb811231c7ff7395b9c9c
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/apr
lib/openssl
lib/apr/util
{% endblock %}

{% block bld_tool %}
bld/scons
bld/pkg/config
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block setup_tools %}
which llvm-ar
ln -s $(which llvm-ar) ar
{% endblock %}

{% block patch %}
(base64 -d | patch -p1) << EOF
{% include '0.diff/base64' %}
EOF

(base64 -d | patch -p1) << EOF
{% include '1.diff/base64' %}
EOF
{% endblock %}

{% block build %}
scons \
    CC=$(which clang)    \
    AR=$(which llvm-ar)  \
    PREFIX=${out}        \
    OPENSSL="${SSL_DIR}" \
    APR="$(which apr-1-config)" \
    APU="$(which apu-1-config)" \
    ZLIB="$(pkg-config --variable=prefix zlib)"
{% endblock %}

{% block install %}
scons install
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-serf=${out} --with-libserf=${out} \${COFLAGS}"
{% endblock %}

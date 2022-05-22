{% extends '//die/c_std.sh' %}

{% block fetch %}
https://www.apache.org/dist/serf/serf-1.3.9.tar.bz2
370a6340ff20366ab088012cd13f2b57
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/apr
lib/openssl
lib/apr/util
{% endblock %}

{% block bld_tool %}
bin/scons
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
    ZLIB="$(find_pkg zlib)"
{% endblock %}

{% block install %}
scons install
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-serf=${out} --with-libserf=${out} \${COFLAGS}"
{% endblock %}

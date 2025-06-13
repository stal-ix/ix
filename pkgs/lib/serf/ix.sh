{% extends '//die/c/ix.sh' %}

{% block pkg_name %}
serf
{% endblock %}

{% block version %}
1.3.10
{% endblock %}

{% block fetch %}
https://github.com/apache/serf/archive/refs/tags/{{self.version().strip()}}.tar.gz
d4369d3be425617e36be92f47136002a3b4e4320065445ba4db74e58c93813c4
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
bld/fake/binutils
{% endblock %}

{% block build_flags %}
shut_up
wrap_cc
{% endblock %}

{% block build %}
scons \
    CC=$(which clang)    \
    PREFIX=${out}        \
    OPENSSL="${SSL_DIR}" \
    APR="$(which apr-1-config)" \
    APU="$(which apu-1-config)" \
    ZLIB="$(pkg-config --variable=prefix zlib)"
{% endblock %}

{% block install %}
scons install
{% endblock %}

{% block env %}
export COFLAGS="--with-serf=${out} --with-libserf=${out} \${COFLAGS}"
{% endblock %}

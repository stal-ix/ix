{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/aws/aws-lc/archive/refs/tags/v1.63.0.tar.gz
8cbfe34e49c9a8ab836a72173e8b919b12dc9605252f25c667358ddc3f2d9c6b
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
BUILD_TESTING=OFF
DISABLE_PERL=ON
DISABLE_GO=ON
DISABLE_CPU_JITTER_ENTROPY=ON
{% endblock %}

{% block env %}
export SSL_DIR="${out}"
export COFLAGS="--with-ssl=${out} --with-openssl=${out} --with-openssldir=${out} --with-ssl-dir=$out \${COFLAGS}"
{% endblock %}

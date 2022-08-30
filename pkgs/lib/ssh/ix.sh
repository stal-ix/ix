{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://www.libssh.org/files/0.10/libssh-0.10.1.tar.xz
sha:da2b3337a0dd1d1e3788376ee471548520cad91a4f3f23ea3f50c5a73a7e69a5
{% endblock %}

{% block lib_deps %}
lib/z
lib/c
lib/c++
lib/openssl
{% endblock %}

{% block env %}
export COFLAGS="--with-libssh=${out} \${COFLAGS}"
{% endblock %}

{% block cmake_flags %}
WITH_EXAMPLES=OFF
WITH_DEBUG_CALLTRACE=OFF
WITH_SYMBOL_VERSIONING=OFF
{% endblock %}

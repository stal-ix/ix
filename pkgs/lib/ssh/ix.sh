{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://www.libssh.org/files/0.10/libssh-0.10.2.tar.xz
sha:15b83d7b74c8c67f758fb32faf1d9a35d5f8f50db523276a419e9876530f098a
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

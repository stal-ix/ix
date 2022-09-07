{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://www.libssh.org/files/0.10/libssh-0.10.4.tar.xz
sha:07392c54ab61476288d1c1f0a7c557b50211797ad00c34c3af2bbc4dbc4bd97d
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

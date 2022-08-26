{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://git.libssh.org/projects/libssh.git/snapshot/libssh-0.10.0.tar.xz
sha:ad2326ccca7e4ffd529073251eeb0a5f509bbf2051afdb6e18944534b1d21328
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

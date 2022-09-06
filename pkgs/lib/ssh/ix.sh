{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://www.libssh.org/files/0.10/libssh-0.10.3.tar.xz
sha:6e889dbe4f3eecd13a452ca868ec85525ab9c39d778519a9c141b83da738c8aa
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

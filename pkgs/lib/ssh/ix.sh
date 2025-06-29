{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libssh
{% endblock %}

{% block version %}
0.11.2
{% endblock %}

{% block fetch %}
https://www.libssh.org/files/0.11/libssh-{{self.version().strip()}}.tar.xz
69529fc18f5b601f0baf0e5a4501a2bc26df5e2f116f5f8f07f19fafaa6d04e7
{% endblock %}

{% block lib_deps %}
lib/z
lib/c
lib/c++
lib/openssl
{% endblock %}

{% block bld_tool %}
bld/prepend
{% endblock %}

{% block env %}
export COFLAGS="--with-libssh=${out} \${COFLAGS}"
{% endblock %}

{% block cmake_flags %}
WITH_EXAMPLES=OFF
WITH_DEBUG_CALLTRACE=OFF
WITH_SYMBOL_VERSIONING=OFF
{% endblock %}

{% block install %}
{{super()}}
prepend ${out}/lib/cmake/libssh/libssh-config.cmake << EOF
find_package(OpenSSL)
EOF
{% endblock %}

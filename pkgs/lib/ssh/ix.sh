{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libssh
{% endblock %}

{% block version %}
0.11.3
{% endblock %}

{% block fetch %}
https://www.libssh.org/files/0.11/libssh-{{self.version().strip()}}.tar.xz
7d8a1361bb094ec3f511964e78a5a4dba689b5986e112afabe4f4d0d6c6125c3
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

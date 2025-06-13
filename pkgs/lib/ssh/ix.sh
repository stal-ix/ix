{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libssh
{% endblock %}

{% block version %}
0.11.1
{% endblock %}

{% block fetch %}
https://www.libssh.org/files/0.11/libssh-{{self.version().strip()}}.tar.xz
14b7dcc72e91e08151c58b981a7b570ab2663f630e7d2837645d5a9c612c1b79
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

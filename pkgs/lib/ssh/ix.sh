{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libssh
{% endblock %}

{% block version %}
0.12.2
{% endblock %}

{% block fetch %}
https://www.libssh.org/files/{{self.version().strip() | field(0)}}.{{self.version().strip() | field(1)}}/libssh-{{self.version().strip()}}.tar.xz
49560f677d96e3706a904ac2de1116e25f3680937d51e5c92198fcba4a1c1e9f
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

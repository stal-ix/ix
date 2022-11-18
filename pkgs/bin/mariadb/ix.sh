{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://rsync.osuosl.org/pub/mariadb/mariadb-10.10.2/source/mariadb-10.10.2.tar.gz
sha:57cbd0112b22b592f657cd4eb82e2f36ad901351317bf8e17849578e803f3cb2
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/xz
lib/fmt
lib/lz4
lib/c++
lib/zstd
lib/boost
lib/bzip/2
lib/curses
lib/gnutls
lib/kernel
lib/pcre/2/posix
{% endblock %}

{% block cmake_flags %}
DISABLE_SHARED=ON
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block cpp_defines %}
ssize_t=long
{% endblock %}

{% block cpp_includes %}
${PWD}/include/providers
{% endblock %}

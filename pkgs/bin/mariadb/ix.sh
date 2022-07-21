{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://rsync.osuosl.org/pub/mariadb/mariadb-10.9.1/source/mariadb-10.9.1.tar.gz
sha:c979bd6641e1dffde34cfb969a14411607ad09bfe5a252d9a8b76c313dbf6736
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
lib/pcre/2/posix
{% if linux %}
lib/linux
{% endif %}
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

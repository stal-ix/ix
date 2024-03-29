{% extends '//die/c/cmake.sh' %}

{% block bld_libs %}
lib/c
lib/z
lib/xz
lib/fmt
lib/lz4
lib/c++
lib/lzo
lib/zstd
lib/boost
lib/bzip/2
lib/curses
lib/gnutls
lib/kernel
lib/snappy
lib/pcre/2
lib/execinfo
lib/readline
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}

{% block cmake_flags %}
WITH_LIBFMT=system
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

{% block install %}
{{super()}}
rm -rf ${out}/mysql-test
rm -rf ${out}/scripts
rm -rf ${out}/sql-bench
rm -rf ${out}/support-files
{% endblock %}

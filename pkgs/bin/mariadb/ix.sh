{% extends '//die/c/cmake.sh' %}

{% block std_box %}
bin/lz4
bld/bison
{{super()}}
{% endblock %}

{% block bld_data %}
bin/mariadb/src(parent_id=mariadb)
{% endblock %}

{% block step_unpack %}
mkdir src; cd src
lz4 -d ${src}/*lz4 - | bsdtar -x -f - --no-same-permissions --no-same-owner --strip-components 1
{% endblock %}

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

{% block install %}
{{super()}}
rm -rf ${out}/mysql-test
rm -rf ${out}/scripts
rm -rf ${out}/sql-bench
rm -rf ${out}/support-files
{% endblock %}

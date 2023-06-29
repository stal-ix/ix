{% extends '//die/c/cmake.sh' %}

{% block git_sha %}
f99832ee7ffdc734073ab3b59c70f3c31c4504b27b0eb8f51ae0b205b30b060f
{% endblock %}

{% block git_repo %}
https://github.com/MariaDB/server.git
{% endblock %}

{% block git_branch %}
mariadb-10.11.2
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

{% block bld_tool %}
bld/bison
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

{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://rsync.osuosl.org/pub/mariadb/mariadb-10.11.1/source/mariadb-10.11.1.tar.gz
sha:ffacf84e74daf249ad64b9573d79a4e882f66b004614f8b33bfcb14a8e25da1d
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

{% block install %}
{{super()}}
rm -rf ${out}/mysql-test
rm -rf ${out}/scripts
rm -rf ${out}/sql-bench
rm -rf ${out}/support-files
{% endblock %}

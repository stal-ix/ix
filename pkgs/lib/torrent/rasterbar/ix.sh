{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/arvidn/libtorrent/releases/download/v2.0.7/libtorrent-rasterbar-2.0.7.tar.gz
sha:3850a27aacb79fcc4d352c1f02a7a59e0e8322afdaa1f5d58d676c02edfcfa36
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/boost
lib/linux
lib/openssl
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/share/cmake/* ${out}/lib/cmake/
rm -rf ${out}/share/cmake
{% endblock %}

{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/arvidn/libtorrent/releases/download/v2.0.10/libtorrent-rasterbar-2.0.10.tar.gz
sha:fc935b8c1daca5c0a4d304bff59e64e532be16bb877c012aea4bda73d9ca885d
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/boost
# TODO(pg): remove it
lib/kernel
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

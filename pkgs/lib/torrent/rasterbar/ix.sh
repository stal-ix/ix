{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/arvidn/libtorrent/releases/download/v2.0.8/libtorrent-rasterbar-2.0.8.tar.gz
sha:09dd399b4477638cf140183f5f85d376abffb9c192bc2910002988e27d69e13e
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

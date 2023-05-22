{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/arvidn/libtorrent/releases/download/v2.0.9/libtorrent-rasterbar-2.0.9.tar.gz
sha:90cd92b6061c5b664840c3d5e151d43fedb24f5b2b24e14425ffbb884ef1798e
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

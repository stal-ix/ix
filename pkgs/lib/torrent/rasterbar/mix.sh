{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/arvidn/libtorrent/releases/download/v2.0.6/libtorrent-rasterbar-2.0.6.tar.gz
sha:438e29272ff41ccc68ec7530f1b98d639f6d01ec8bf680766336ae202a065722
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

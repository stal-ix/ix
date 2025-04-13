{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libtorrent
{% endblock %}

{% block version %}
2.0.11
{% endblock %}

{% block fetch %}
https://github.com/arvidn/libtorrent/releases/download/v{{self.version().strip()}}/libtorrent-rasterbar-{{self.version().strip()}}.tar.gz
sha:f0db58580f4f29ade6cc40fa4ba80e2c9a70c90265cd77332d3cdec37ecf1e6d
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

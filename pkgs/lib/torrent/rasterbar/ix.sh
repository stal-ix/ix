{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libtorrent-rasterbar
{% endblock %}

{% block version %}
2.1.1
{% endblock %}

{% block fetch %}
https://github.com/arvidn/libtorrent/releases/download/v{{self.version().strip()}}/libtorrent-rasterbar-{{self.version().strip()}}.tar.gz
0f163516ecef2e3331500266751de3098835a3c3ae0c2290448046c632bc0e93
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

{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
qBittorrent
{% endblock %}

{% block version %}
5.0.5
{% endblock %}

{% block fetch %}
https://github.com/qbittorrent/qBittorrent/archive/refs/tags/release-{{self.version().strip()}}.tar.gz
sha:79b030565fa392a6bc267b24f538d7b8e762f607ee734b3d459b19c61c168b73
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/c++
lib/boost
lib/openssl
lib/sqlite/3
lib/execinfo
lib/torrent/rasterbar
{% endblock %}

{% block bld_tool %}
bld/qt/6
bld/qt/6/tools
{% endblock %}

{% block cmake_flags %}
QT6=ON
{% endblock %}

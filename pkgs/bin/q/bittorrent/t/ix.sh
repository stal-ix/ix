{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
qBittorrent
{% endblock %}

{% block version %}
5.1.2
{% endblock %}

{% block fetch %}
https://github.com/qbittorrent/qBittorrent/archive/refs/tags/release-{{self.version().strip()}}.tar.gz
a35448f3c8cb57d033bd3c4bd66c63417b0ca793ae7e9c5c5053960e2229ad9e
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

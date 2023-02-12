{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://sourceforge.net/projects/qbittorrent/files/qbittorrent/qbittorrent-4.5.1/qbittorrent-4.5.1.tar.xz
sha:0527a5887454d6a5f386846f3c73029a6fbeec3d1a4c92e1dc485c485c16add0
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/c++
lib/boost
lib/openssl
lib/sqlite/3
lib/execinfo
lib/qt/6/deps
lib/qt/6/base
lib/torrent/rasterbar
{% endblock %}

{% block bld_tool %}
bld/qt/6
bld/qt/6/tools
{% endblock %}

{% block cmake_flags %}
QT6=ON
{% endblock %}

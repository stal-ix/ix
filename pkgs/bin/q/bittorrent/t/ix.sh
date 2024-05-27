{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/qbittorrent/qBittorrent/archive/refs/tags/release-4.6.5.tar.gz
sha:f330042fd0b27530b4a7b70b5d7ab356b2c9246393761df3b06891dc9dd8c106
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

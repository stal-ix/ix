{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/qbittorrent/qBittorrent/archive/refs/tags/release-4.6.1.tar.gz
sha:100097f33c7313b27a704ad429ae09c5e8da5ae504dfecf1811e6fe54d23fa51
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

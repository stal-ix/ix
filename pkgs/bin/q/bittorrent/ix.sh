{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://sourceforge.net/projects/qbittorrent/files/qbittorrent/qbittorrent-4.5.2/qbittorrent-4.5.2.tar.xz
sha:109ecff22cb80f1e3ee5b7d3d2d34537839c15f75030632ef131d92b047f4e05
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

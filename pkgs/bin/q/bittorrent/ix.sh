{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/qbittorrent/qBittorrent/archive/refs/tags/release-4.5.4.tar.gz
sha:ded3a1ffba1e97ecde3862714bea9e9a1cc7275c29545d81976174ac5760bab5
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

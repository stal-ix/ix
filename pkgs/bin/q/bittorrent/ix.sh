{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/qbittorrent/qBittorrent/archive/refs/tags/release-4.6.0.tar.gz
sha:f1cb8a677d2c882d3aa7f6fdebd9671950d7d6578480ace7529b498b13480804
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

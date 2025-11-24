{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
qBittorrent
{% endblock %}

{% block version %}
5.1.4
{% endblock %}

{% block fetch %}
https://github.com/qbittorrent/qBittorrent/archive/refs/tags/release-{{self.version().strip()}}.tar.gz
ab37deeb364049a308127c572f139bd5eb0535fa355db8821e5aa31990b5625e
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

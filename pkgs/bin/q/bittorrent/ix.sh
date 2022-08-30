{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/qbittorrent/qbittorrent/qbittorrent-4.4.5/qbittorrent-4.4.5.tar.xz
sha:0d6ed3948d4ad0d63f01510fe902639ae7b383ccfc1c01e88b75fba5b29ff3b3
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

{% block install %}
{{super()}}
{{hooks.wrap_xdg_binary('qbittorrent')}}
{% endblock %}

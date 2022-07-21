{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/qbittorrent/qbittorrent/qbittorrent-4.4.3.1/qbittorrent-4.4.3.1.tar.xz
sha:b64559ca50b54bc6c5be17302e69f34fba8433059842aa4093865dc2c00d24c8
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

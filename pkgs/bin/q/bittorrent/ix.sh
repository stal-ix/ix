{% extends '//die/cmake.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/qbittorrent/qbittorrent/qbittorrent-4.4.3/qbittorrent-4.4.3.tar.xz
sha:e2744b3df486bea69bfb8f81f56da9d660dd0785cf521fd58952d80a1edc7368
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/c++
lib/boost
lib/sqlite3
lib/openssl
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

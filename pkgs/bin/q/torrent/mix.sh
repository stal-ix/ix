{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/qbittorrent/qbittorrent/qbittorrent-4.4.2/qbittorrent-4.4.2.tar.xz
sha:efa580924e96605bae916b9a8ae1f3fce82a5130647ae41d74d689761262463d
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

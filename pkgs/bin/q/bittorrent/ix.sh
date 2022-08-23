{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/qbittorrent/qbittorrent/qbittorrent-4.4.4/qbittorrent-4.4.4.tar.xz
sha:cd1b6f78e9d4b5414d2fc97d98015f9ce11a4708ef90237556577a1f4632a145
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

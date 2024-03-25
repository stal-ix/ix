{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/qbittorrent/qBittorrent/archive/refs/tags/release-4.6.4.tar.gz
sha:5842eb2cc1745b72b090df562d35a7ec0a6469d898d411544808731578447e1d
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

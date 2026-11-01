{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
qBittorrent
{% endblock %}

{% block version %}
5.3.0
{% endblock %}

{% block fetch %}
https://github.com/qbittorrent/qBittorrent/archive/refs/tags/release-{{self.version().strip()}}.tar.gz
dcb5273496117ebf264fc1fc7936de8707374f07dcee0805228ac5adb403a465
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/c++
lib/boost
lib/openssl
lib/sqlite/3
lib/execinfo
# 2.1 dropped storage_params::mapped_files, qBittorrent still uses it
lib/torrent/rasterbar/2/0
{% endblock %}

{% block bld_tool %}
bld/qt/6
bld/qt/6/tools
{% endblock %}

{% block cmake_flags %}
QT6=ON
{% endblock %}

{% block cxx_flags %}
# Qt 6.12 takes = delete("reason") from clang, and qBittorrent builds with -pedantic-errors
-Wno-c++26-extensions
{% endblock %}

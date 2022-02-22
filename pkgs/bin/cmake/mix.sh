{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/Kitware/CMake/archive/refs/tags/v3.22.2.tar.gz
sha:584c7b1cbf155971bb70aaea56b748317e00f93ca4210e9fd11c1ac6c38c6747
{% endblock %}

{% block bld_libs %}
{% if darwin %}
lib/darwin/framework/CoreFoundation
{% endif %}

{% if linux %}
lib/linux
{% endif %}

lib/z
lib/c
lib/uv
lib/xz
lib/c++
lib/curl
lib/bzip2
lib/expat
lib/curses
lib/archive
{% endblock %}

{% block std_box %}
bld/bootbox
{% endblock %}

{% block cmake_flags %}
BUILD_TESTING=OFF
CMAKE_USE_SYSTEM_EXPAT=ON
CMAKE_USE_SYSTEM_ZLIB=ON
CMAKE_USE_SYSTEM_LIBUV=ON
CMAKE_USE_SYSTEM_CURL=ON
CMAKE_USE_SYSTEM_BZIP2=ON
CMAKE_USE_SYSTEM_LIBLZMA=ON
CMAKE_USE_SYSTEM_LIBARCHIVE=ON
{% endblock %}

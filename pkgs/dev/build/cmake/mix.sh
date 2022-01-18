{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/Kitware/CMake/archive/refs/tags/v3.22.0.tar.gz
23396af0779893f2c6723faa74da5b85
{% endblock %}

{% block bld_libs %}
{% if target.os == 'darwin' %}
lib/darwin/framework/CoreFoundation
{% endif %}

{% if target.os == 'linux' %}
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
box/boot
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

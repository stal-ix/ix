{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/Kitware/CMake/archive/refs/tags/v3.23.1.tar.gz
sha:5e551ab9ded8873b5fe9217b8b4d9a011763b13c8475dd5ac445f575740b6636
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
lib/bzip2
lib/expat
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

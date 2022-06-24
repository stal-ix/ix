{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/Kitware/CMake/archive/refs/tags/v3.23.2.tar.gz
sha:b19401d6816d1153f0f8e14e99377b86d8b07abccfadf2ed2aa4de7572b43ada
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
lib/expat
lib/bzip/2
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

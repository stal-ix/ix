{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Kitware/CMake/archive/refs/tags/v3.25.3.tar.gz
sha:69d13e1eddcdefcd5d4ac1876c01487d2a8d0abeaf45613a42e4afd6c2f70d2e
{% endblock %}

{% block bld_libs %}
{% if darwin %}
lib/darwin/framework/CoreFoundation
{% endif %}
lib/z
lib/c
lib/uv
lib/xz
lib/c++
lib/rhash
lib/expat
lib/kernel
lib/bzip/2
{% endblock %}

{% block cmake_flags %}
CMAKE_USE_SYSTEM_RHASH=ON
CMAKE_USE_SYSTEM_EXPAT=ON
CMAKE_USE_SYSTEM_ZLIB=ON
CMAKE_USE_SYSTEM_LIBUV=ON
CMAKE_USE_SYSTEM_CURL=ON
CMAKE_USE_SYSTEM_BZIP2=ON
CMAKE_USE_SYSTEM_LIBLZMA=ON
CMAKE_USE_SYSTEM_LIBARCHIVE=ON
{% endblock %}

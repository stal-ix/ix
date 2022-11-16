{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Kitware/CMake/archive/refs/tags/v3.24.3.tar.gz
sha:766927ced9a9948b4cb8377821fb8325fec861b15cbe847f9e61d3578872d254
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

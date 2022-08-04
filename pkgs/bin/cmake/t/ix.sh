{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Kitware/CMake/archive/refs/tags/v3.23.3.tar.gz
sha:013f688b7da463dcd1e7afde769081af21cb24365aefc246761cfb2e04cd2872
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
lib/rhash
lib/expat
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

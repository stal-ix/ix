{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Kitware/CMake/archive/refs/tags/v3.30.1.tar.gz
sha:65741feafacff2e3bcbd22be37bf633c3ecb77c6b65190dd6b91b533d8e05f9a
{% endblock %}

{% block bld_libs %}
{% if darwin %}
lib/darwin/framework/CoreFoundation
{% endif %}
lib/z
lib/c
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

{% block env %}
# for meson
export CMAKE=${out}/bin/cmake
{% endblock %}

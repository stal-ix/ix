{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/nodejs/uvwasi/archive/refs/tags/v0.0.18.tar.gz
sha:4e5d2447df0922eda42488c411cd07806f0a6b55e7f98edecd5562b317daf8e3
{% endblock %}

{% block lib_deps %}
lib/c
lib/uv
{% endblock %}

{% block cmake_flags %}
WITH_SYSTEM_LIBUV=ON
UVWASI_BUILD_TESTS=OFF
CMAKE_INSTALL_BINDIR=bin
CMAKE_INSTALL_INCLUDEDIR=include
{% endblock %}

{% block patch %}
# from https://aur.archlinux.org/cgit/aur.git/tree/cmake_install.patch?h=mingw-w64-uvwasi
base64 -d << EOF >> CMakeLists.txt
{% include 'cmake/base64' %}
EOF
{% endblock %}

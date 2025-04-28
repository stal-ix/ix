{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
uvwasi
{% endblock %}

{% block version %}
0.0.21
{% endblock %}

{% block fetch %}
https://github.com/nodejs/uvwasi/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:5cf32f166c493f41c0de7f3fd578d0be1b692c81c54f0c68889e62240fe9ab60
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

{% block install %}
{{super()}}
sed -e 's|exec_prefix=.*||' \
    -e 's|bindir=.*||' \
    -e 's|;.*||' \
    -i ${out}/lib/pkgconfig/uvwasi.pc
{% endblock %}

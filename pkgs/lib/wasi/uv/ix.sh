{% extends '//die/c/cmake.sh' %}

# check bin/wasm/3

{% block pkg_name %}
uvwasi
{% endblock %}

{% block version %}
0.0.23
{% endblock %}

{% block fetch %}
https://github.com/nodejs/uvwasi/archive/refs/tags/v{{self.version().strip()}}.tar.gz
cdb148aac298883b51da887657deca910c7c02f35435e24f125cef536fe8d5e1
{% endblock %}

{% block lib_deps %}
lib/c
lib/uv
lib/shim/fake(lib_name=uvwasi_a)
{% endblock %}

{% block build_flags %}
wrap_cc
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

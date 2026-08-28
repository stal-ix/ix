{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
contour
{% endblock %}

{% block version %}
0.7.0.8982
{% endblock %}

{% block fetch %}
https://github.com/contour-terminal/contour/archive/refs/tags/v{{self.version().strip()}}.tar.gz
9afaaed7f705c56e413938f43d338c7700ca69122a531d94c10c8eb9f5a44c28
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/gsl/ms
lib/unicode
lib/yaml/cpp
lib/range/v3
lib/freetype
lib/boxed/cpp
lib/qt/6/base
lib/qt/6/deps
lib/qt/6/compat
lib/reflection/cpp
lib/qt/6/multimedia
lib/qt/6/declarative/deps
lib/shim/fake(lib_name=xcb)
{% endblock %}

{% block bld_tool %}
bin/tic
bld/qt/6
bld/qt/6/tools
bld/qt/6/tools/qml
bld/qt/6/tools/shader
{% endblock %}

{% block cmake_flags %}
CONTOUR_WITH_UTEMPTER=OFF
CONTOUR_BUILD_STATIC=ON
CONTOUR_USE_CPM=OFF
{% endblock %}

{% block patch %}
base64 -d << EOF > compat.patch
{% include 'compat.patch/base64' %}
EOF
patch -p1 < compat.patch
{% endblock %}

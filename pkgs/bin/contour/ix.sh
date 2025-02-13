{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/contour-terminal/contour/archive/refs/tags/v0.6.1.7494.tar.gz
sha:15090a08cf05124bf05074130cc6460d1d34c6d80f1058c63202effa032b8f6f
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
bld/prepend
bld/qt/6/tools
bld/qt/6/tools/qml
bld/qt/6/tools/shader
{% endblock %}

{% block cmake_flags %}
CONTOUR_WITH_UTEMPTER=OFF
{% endblock %}

{% block patch %}
sed -e 's|.*_3_3_.*||' -i src/contour/display/Blur.h
prepend src/contour/display/OpenGLRenderer.cpp << EOF
#include <GL/gl.h>
EOF
base64 -d << EOF > src/contour/BlurBehind.cpp
{% include 'BlurBehind.cpp/base64' %}
EOF
{% endblock %}

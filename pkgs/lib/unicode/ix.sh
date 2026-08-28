{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libunicode
{% endblock %}

{% block version %}
0.9.3
{% endblock %}

{% block fetch %}
https://github.com/contour-terminal/libunicode/archive/refs/tags/v{{self.version().strip()}}.tar.gz
78b715bc2d929530bc89e47c1c6772b72f511e1831b14e7d6d92cceb62592920
https://www.unicode.org/Public/17.0.0/ucd/UCD.zip
2066d1909b2ea93916ce092da1c0ee4808ea3ef8407c94b4f14f5b7eb263d28e
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block unpack %}
{{super()}}
cp ${src}/UCD.zip ucd-17.0.0.zip
mkdir ucd-17.0.0
cd ucd-17.0.0
unzip ../ucd-17.0.0.zip
cd ..
{% endblock %}

{% block bld_tool %}
bin/unzip
bld/python
{% endblock %}

{% block cmake_flags %}
LIBUNICODE_EXAMPLES=OFF
LIBUNICODE_TESTING=OFF
LIBUNICODE_BENCHMARK=OFF
LIBUNICODE_TOOLS=OFF
LIBUNICODE_BUILD_STATIC=ON
LIBUNICODE_UCD_BASE_DIR=${PWD}
{% endblock %}

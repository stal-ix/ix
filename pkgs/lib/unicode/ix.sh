{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libunicode
{% endblock %}

{% block version %}
0.9.4
{% endblock %}

{% block fetch %}
https://github.com/contour-terminal/libunicode/archive/refs/tags/v{{self.version().strip()}}.tar.gz
aa6bc519712c541649553096c2b722c39a3ede765b9dc2d103012f1f90bec331
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

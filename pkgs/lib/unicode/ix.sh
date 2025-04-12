{% extends '//die/c/cmake.sh' %}

{% block version %}
0.6.0
{% endblock %}

{% block fetch %}
https://github.com/contour-terminal/libunicode/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:0c217f8264000f1b8c36e78969cb9cf91ac97de937cc141ab78e6b1ad7f404ef
https://www.unicode.org/Public/16.0.0/ucd/UCD.zip
sha:c86dd81f2b14a43b0cc064aa5f89aa7241386801e35c59c7984e579832634eb2
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block unpack %}
{{super()}}
cp ${src}/UCD.zip ucd-16.0.0.zip
mkdir ucd-16.0.0
cd ucd-16.0.0
unzip ../ucd-16.0.0.zip
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

{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://storage.googleapis.com/aom-releases/libaom-3.4.0.tar.gz
sha:bd754b58c3fa69f3ffd29da77de591bd9c26970e3b18537951336d6c0252e354
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/c++
{% endblock %}

{% block bld_tool %}
bld/perl
bin/nasm
{% endblock %}

{% block cmake_flags %}
ENABLE_EXAMPLES=OFF
ENABLE_TESTS=OFF
ENABLE_TOOLS=OFF
ENABLE_DOCS=OFF
ENABLE_NASM=ON
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|//.*/|/|' -i ${out}/lib/pkgconfig/aom.pc
{% endblock %}

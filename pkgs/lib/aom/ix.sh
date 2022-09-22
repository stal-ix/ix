{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://storage.googleapis.com/aom-releases/libaom-3.5.0.tar.gz
sha:d37dbee372e2430a7efde813984ae6d78bdf1fc4080ebe32457c9115408b0738
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

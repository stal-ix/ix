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
{% if x86_64 %}
bin/nasm
{% endif %}
{% endblock %}

{% block cmake_flags %}
AOM_TARGET_CPU={{target.arch}}
ENABLE_EXAMPLES=OFF
ENABLE_WERROR=OFF
ENABLE_TESTS=OFF
ENABLE_TOOLS=OFF
ENABLE_DOCS=OFF
{% if x86_64 %}
ENABLE_AVX=ON
ENABLE_MMX=ON
ENABLE_SSE=ON
ENABLE_VSX=ON
ENABLE_AVX2=ON
ENABLE_NASM=ON
ENABLE_SSE2=ON
ENABLE_SSE3=ON
ENABLE_SSSE3=ON
ENABLE_SSE4_1=ON
ENABLE_SSE4_2=ON
{% endif %}
{% if aarch64 %}
ENABLE_NEON=ON
{% endif %}
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|//.*/|/|' -i ${out}/lib/pkgconfig/aom.pc
{% endblock %}

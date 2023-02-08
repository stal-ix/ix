{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://storage.googleapis.com/aom-releases/libaom-3.6.0.tar.gz
sha:a4a6c0fab685da743b796662a928fcdf7ae60594edc306efb73e78a17ea6cde6
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
#ENABLE_AVX=ON
#ENABLE_AVX2=ON
ENABLE_MMX=ON
ENABLE_SSE=ON
ENABLE_NASM=ON
ENABLE_SSE2=ON
ENABLE_SSE3=ON
ENABLE_SSSE3=ON
ENABLE_SSE4_1=ON
ENABLE_SSE4_2=ON
ARCH_X86_64=ON
#HAVE_AVX=ON
#HAVE_AVX2=ON
HAVE_MMX=ON
HAVE_SSE=ON
HAVE_SSE2=ON
HAVE_SSE3=ON
HAVE_SSE4_1=ON
HAVE_SSE4_2=ON
HAVE_SSSE3=ON
{% endif %}
{% if aarch64 %}
ENABLE_NEON=ON
ARCH_ARM=ON
HAVE_NEON=ON
{% endif %}
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|//.*/|/|' -i ${out}/lib/pkgconfig/aom.pc
{% endblock %}

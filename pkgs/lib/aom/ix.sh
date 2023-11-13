{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://storage.googleapis.com/aom-releases/libaom-3.7.0.tar.gz
sha:d1773bb6f050b430af47741306ac37a6aa2fec7364cb0dc27e3b1454a138934f
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
{% if darwin %}
bld/cctools
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
ENABLE_MMX=ON
ENABLE_SSE=ON
ENABLE_NASM=ON
ENABLE_SSE2=ON
ENABLE_SSE3=ON
ENABLE_SSSE3=ON
ENABLE_SSE4_1=ON
ENABLE_SSE4_2=ON
ARCH_X86_64=ON
HAVE_MMX=1
HAVE_SSE=1
HAVE_SSE2=1
HAVE_SSE3=1
HAVE_SSE4_1=1
HAVE_SSE4_2=1
HAVE_SSSE3=1
{% endif %}
{% if aarch64 %}
ENABLE_NEON=ON
ARCH_ARM=ON
{% endif %}
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|//.*/|/|' -i ${out}/lib/pkgconfig/aom.pc
{% endblock %}

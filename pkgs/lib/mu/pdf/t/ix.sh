{% extends '//die/c/make.sh' %}

{% block pkg_name %}
mupdf
{% endblock %}

{% block version %}
1.26.5
{% endblock %}

{% block fetch %}
https://mupdf.com/downloads/archive/mupdf-{{self.version().strip()}}-source.tar.gz
a52daf7b2f41c5dc94d4691cd1e7cae25fc488556e614d8c3c4491d327473c40
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/jpeg
lib/curl
lib/gumbo
lib/mu/js
lib/lcms/2
lib/jbig2dec
lib/freetype
lib/harfbuzz
lib/jpeg/open
{% endblock %}

{% block bld_tool %}
bin/ld(for_target={{target.gnu.three}})
bld/pkg/config
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block make_flags %}
USE_SYSTEM_LIBS=yes
{% endblock %}

{% block cpp_missing %}
limits.h
{% endblock %}

{% block setup_target_flags %}
{# too much memory with llvm toolchain #}
export LD=ld
{% endblock %}

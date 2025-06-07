{% extends '//die/c/make.sh' %}

{% block pkg_name %}
mupdf
{% endblock %}

{% block version %}
1.26.2
{% endblock %}

{% block fetch %}
https://mupdf.com/downloads/archive/mupdf-{{self.version().strip()}}-source.tar.gz
sha:2a5e1fc84f67bc593ba1d4d9d49f8782e8b12241e2eec904a65a25e4322c72a9
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

{% extends '//die/c/make.sh' %}

{% block pkg_name %}
mupdf
{% endblock %}

{% block version %}
1.25.6
{% endblock %}

{% block fetch %}
https://mupdf.com/downloads/archive/mupdf-{{self.version().strip()}}-source.tar.gz
sha:5a51d8bd5ed690d3c8bf82b3c7c3f1cf5f9dde40887a36e3b5aa78a7e3ccd1bb
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

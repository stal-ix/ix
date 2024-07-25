{% extends '//die/c/make.sh' %}

{% block fetch %}
https://mupdf.com/downloads/archive/mupdf-1.24.8-source.tar.gz
sha:a518d9be976cdb2006d45382d7ffb1b9b8d64bc3fd3cb73ca6270d752fa7f448
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

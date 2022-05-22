{% extends '//die/make.sh' %}

{% block fetch %}
https://mupdf.com/downloads/archive/mupdf-1.19.1-source.tar.xz
sha:b5eac663fe74f33c430eda342f655cf41fa73d71610f0884768a856a82e3803e
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/jpeg
lib/curl
lib/lcms2
lib/gumbo
lib/mu/js
lib/jbig2dec
lib/freetype
lib/harfbuzz
lib/jpeg/open
{% endblock %}

{% block bld_tool %}
bin/binutils(for_target={{target.gnu.three}})
bld/pkg/config
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block make_flags %}
USE_SYSTEM_LIBS=yes
{% endblock %}

{% block setup %}
export LD=ld
{% endblock %}

{% extends '//die/c/make.sh' %}

{% block fetch %}
https://mupdf.com/downloads/archive/mupdf-1.21.1-source.tar.lz
sha:66a43490676c7f7c2ff74067328ef13285506fcc758d365ae27ea3668bd5e620
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

{% block setup %}
export LD=ld
{% endblock %}

{% extends '//mix/make.sh' %}

{% block fetch %}
https://mupdf.com/downloads/archive/mupdf-1.19.0-source.tar.xz
sha:38f39943e408d60a3e7d6c2fca0d705163540ca24d65682d4426dc6f1fee28c5
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

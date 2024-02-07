{% extends '//die/c/make.sh' %}

{% block fetch %}
https://mupdf.com/downloads/archive/mupdf-1.23.10-source.tar.gz
sha:c3a2eaf19b3f0d58f923bf7132b72eff6205db4cea2f9c4651ee5ec9095242da
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
export LD=ld
{% endblock %}

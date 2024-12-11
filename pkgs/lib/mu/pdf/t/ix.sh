{% extends '//die/c/make.sh' %}

{% block fetch %}
https://mupdf.com/downloads/archive/mupdf-1.25.2-source.tar.gz
sha:36ccf6a5e691e188acf8db6e98d08bf05f27bb4ce30432dc15fc76d329a92d4d
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

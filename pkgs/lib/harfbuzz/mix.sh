{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://github.com/harfbuzz/harfbuzz/archive/refs/tags/3.2.0.tar.gz
148168f3e8d3bb5b4ec1a13a50bb9155
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/glib
lib/freetype
{% if harfbuzz_icu %}
lib/icu
{% endif %}
{% if target.os == 'darwin' %}
lib/darwin/framework/CoreText
lib/darwin/framework/ApplicationServices
{% endif %}
{% endblock %}

{% block bld_libs %}
lib/cairo
{% endblock %}

{% block bld_tool %}
lib/glib/mix.sh
dev/tool/ragel/6
{% endblock %}

{% block meson_flags %}
{% if target.os == 'darwin' %}
coretext=enabled
{% endif %}
glib=enabled
gobject=enabled
tests=disabled
cairo=enabled
{% endblock %}

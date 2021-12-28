{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://github.com/harfbuzz/harfbuzz/archive/refs/tags/3.1.1.tar.gz
6d0a0359efda30ec8e5611f9006120b7
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/glib
lib/freetype
{% if target.os == 'darwin' %}
lib/darwin/framework/CoreText
lib/darwin/framework/ApplicationServices
{% endif %}
{% endblock %}

{% block bld_libs %}
lib/cairo
{% endblock %}

{% block bld_tool %}
dev/tool/ragel/6
{% endblock %}

{% block meson_flags %}
{% if target.os == 'darwin' %}
-Dcoretext=enabled
{% endif %}
-Dglib=enabled
-Dgobject=disabled
-Dtests=disabled
-Dcairo=enabled
{% endblock %}

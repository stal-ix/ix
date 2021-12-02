{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://github.com/harfbuzz/harfbuzz/archive/refs/tags/3.1.1.tar.gz
6d0a0359efda30ec8e5611f9006120b7
{% endblock %}

{% block lib_deps %}
lib/c++/mix.sh
lib/glib/mix.sh
lib/freetype/mix.sh
{% if mix.platform.target.os == 'darwin' %}
lib/darwin/framework/CoreText/mix.sh
lib/darwin/framework/ApplicationServices/mix.sh
{% endif %}
{% endblock %}

{% block bld_libs %}
lib/cairo/mix.sh
{% endblock %}

{% block bld_tool %}
dev/tool/ragel/6/mix.sh
{% endblock %}

{% block meson_flags %}
{% if mix.platform.target.os == 'darwin' %}
-Dcoretext=enabled
{% endif %}
-Dglib=enabled
-Dgobject=disabled
-Dtests=disabled
-Dcairo=enabled
{% endblock %}

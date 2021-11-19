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
dev/build/cmake/mix.sh
dev/build/pkg-config/mix.sh
dev/tool/ragel/6/mix.sh
{% endblock %}

{% block setup %}
export CFLAGS="-w ${CFLAGS}"
{% endblock %}

{% block meson_flags %}
-Ddefault_library=static
-Dcoretext=enabled
-Dglib=enabled
-Dgobject=disabled
-Dtests=disabled
{% endblock %}

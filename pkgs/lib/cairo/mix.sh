{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://cairographics.org/snapshots/cairo-1.17.4.tar.xz
bf9d0d324ecbd350d0e9308125fa4ce0
{% endblock %}

{% block lib_deps %}
{% if mix.platform.target.os == 'darwin' %}
lib/darwin/framework/ApplicationServices/mix.sh
lib/darwin/framework/CoreGraphics/mix.sh
{% endif %}
lib/png/mix.sh
lib/lzo/mix.sh
lib/freetype/mix.sh
lib/pixman/mix.sh
{% endblock %}

{% block bld_tool %}
gnu/which/mix.sh
dev/build/autoconf/2/69/mix.sh
dev/build/automake/1.16.3/mix.sh
{% endblock %}

{% block autoreconf %}
libtoolize -c
autoreconf -i
{% endblock %}

{% block coflags %}
--enable-trace=no
{% endblock %}

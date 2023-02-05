{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/cairo/cairo/-/archive/1.17.8/cairo-1.17.8.tar.bz2
sha:ead4724423eb969f98b456fe1e3ee1e1741fe1c8dfb1a41ca12afa81a6c1665f
{% endblock %}

{% block lib_deps %}
lib/c
lib/png
lib/glib
lib/pixman

{% if linux %}
lib/freetype
lib/fontconfig
{% endif %}

{% if darwin %}
lib/darwin/framework/ApplicationServices
lib/darwin/framework/CoreGraphics
{% endif %}
{% endblock %}

{% block meson_flags %}
tests=disabled
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block patch %}
sed -e 's|.*conf.*set.*CAIRO_HAS_TRACE.*||' -i meson.build
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/cairo \${CPPFLAGS}"
export CMFLAGS="-DCAIRO_INCLUDE_DIR=${out}/include/cairo \${CMFLAGS}"
{% endblock %}

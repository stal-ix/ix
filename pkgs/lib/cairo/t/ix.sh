{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/cairo/cairo/-/archive/1.18.0/cairo-1.18.0.tar.bz2
sha:abf8fba4d510086a492783c3e0828e90b32734738fd80906595617d229d02bab
{% endblock %}

{% block lib_deps %}
lib/c
lib/png
lib/glib
lib/pixman
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

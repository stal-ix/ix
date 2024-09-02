{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/cairo/cairo/-/archive/1.18.2/cairo-1.18.2.tar.bz2
sha:0b895967abfae888ecad9ace4bce475a27e1b9aaeedaaf334b97c96f13ccc604
{% endblock %}

{% block meson_tool %}
bld/meson/4
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

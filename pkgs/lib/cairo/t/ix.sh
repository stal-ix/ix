{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
cairo
{% endblock %}

{% block version %}
1.18.6
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/cairo/cairo/-/archive/{{self.version().strip()}}/cairo-{{self.version().strip()}}.tar.bz2
42b785e00ef97a687c9e32ad26dde55b4371215c0ee20b39cab63294a9fe8f0c
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

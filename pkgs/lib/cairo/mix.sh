{% extends '//die/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/cairo/cairo/-/archive/1.17.6/cairo-1.17.6.tar.bz2
sha:90496d135c9ef7612c98f8ee358390cdec0825534573778a896ea021155599d2
{% endblock %}

{% block lib_deps %}
lib/c
lib/png
lib/lzo
lib/glib
lib/pixman
lib/opengl
lib/freetype
lib/fontconfig
lib/mesa/glesv2

{% if darwin %}
lib/darwin/framework/ApplicationServices
lib/darwin/framework/CoreGraphics
{% endif %}
{% endblock %}

{% block meson_flags %}
fontconfig=enabled
freetype=enabled
glesv2=enabled
glesv3=enabled
gl-backend=auto
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block patch %}
sed -e 's|.*conf.*set.*CAIRO_HAS_TRACE.*||' -i meson.build
{% endblock %}

{% block env_lib %}
export CPPFLAGS="-I${out}/include/cairo \${CPPFLAGS}"
{% endblock %}

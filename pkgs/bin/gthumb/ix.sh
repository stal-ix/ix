{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/GNOME/gthumb/archive/refs/tags/3.12.2.tar.gz
sha:386fabb6f4a780f723d27f268a1819d08dd7a6ebb3b5e52181d625f23c6d9188
{% endblock %}

{% block bld_libs %}
lib/c
lib/jxl
lib/tiff
lib/webp
lib/heif
lib/exiv2
lib/gtk/3
lib/secret
lib/lcms/2
lib/gsettings/desktop/schemas
{% endblock %}

{% block meson_flags %}
colord=false
clutter=false
gstreamer=false
libraw=false
librsvg=false
webservices=false
libbrasero=false
{% endblock %}

{% block bld_tool %}
bld/glib
bld/gnome
bld/gettext
{% endblock %}

{% block patch %}
# need itstool
sed -e 's|.*subdir.*help.*||' -e 's|.*subdir.*po.*||' -i meson.build
{% endblock %}

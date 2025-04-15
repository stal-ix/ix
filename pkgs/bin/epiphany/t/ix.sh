{% extends '//die/c/gnome.sh' %}

{% block pkg_name %}
epiphany
{% endblock %}

{% block version %}
48.0
{% endblock %}

{% block fetch %}
https://github.com/GNOME/epiphany/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:930b72f72e42e4f53e25fd4d0b4e4ca6e1e8274a6430ec5c8b004a4f78600f4d
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk
lib/gmp
lib/gcr
lib/glib
lib/xml/2
lib/cairo
lib/portal
lib/soup/3
lib/nettle
lib/secret
lib/archive
lib/sqlite/3
lib/gtk/deps
lib/json/glib
lib/gdk/pixbuf
lib/web/kit/gtk
lib/glib/networking
lib/gsettings/desktop/schemas
lib/{{allocator}}/trim(delay=5,bytes=10000000)
{% endblock %}

{% block use_data %}
aux/iso/codes
{% endblock %}

{% block meson_flags %}
unit_tests=disabled
{% endblock %}

{% block patch %}
sed -e 's|.*subdir.*help.*||' -i meson.build
{% endblock %}

{% block install %}
{{super()}}
rm -r ${out}/bin/bin_*
{% endblock %}

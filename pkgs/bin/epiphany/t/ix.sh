{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://github.com/GNOME/epiphany/archive/refs/tags/45.0.tar.gz
sha:0c0060d775a42d7142556516135a0568c53c9de8292cd5a9d2168f55eb2e8002
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

{% block bld_tool %}
bld/gettext
{% endblock %}

{% block use_data %}
aux/iso-codes
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

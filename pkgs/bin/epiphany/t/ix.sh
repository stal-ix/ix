{% extends '//die/c/gnome.sh' %}

{% block pkg_name %}
epiphany
{% endblock %}

{% block version %}
51.2
{% endblock %}

{% block fetch %}
https://github.com/GNOME/epiphany/archive/refs/tags/{{self.version().strip()}}.tar.gz
8a3392d7e7d436bf16ab4b3e787a518dba9eabccdb17c863d5c7dadb259c8144
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
lib/pwquality
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

{% block bld_data %}
lib/glib/gir
lib/adwaita/vapi
lib/pango/gir
lib/graphene/gir
lib/harfbuzz/gir
lib/gdk/pixbuf/gir
lib/gi/repository/gir
lib/gtk/4/gir
{% endblock %}

{% block bld_tool %}
bld/blueprint/compiler
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

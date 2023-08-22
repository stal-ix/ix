{% extends '//die/c/gnome.sh' %}

{% block fetch %}
#https://github.com/GNOME/epiphany/archive/refs/tags/44.6.tar.gz
#sha:fea2c8a3b0a178f87245004781a1e7a8766390961ac7dc9101843d9e8b4b4272
https://github.com/GNOME/epiphany/archive/refs/tags/45.beta.tar.gz
sha:e145f1c1bf1888abf087a101ce6a1791c60a69028236376a3e38c9a04b446692
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

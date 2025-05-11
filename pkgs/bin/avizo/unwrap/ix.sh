{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
avizo
{% endblock %}

{% block version %}
1.3
{% endblock %}

{% block fetch %}
https://github.com/heyjuvi/avizo/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:2b1f5817a916e518b0c10c4c94a3678a5054b879eb32c10b5d1425faa6387127
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk
lib/glib
lib/wayland
lib/gi/repository
lib/gtk/layer/shell
{% endblock %}

{% block bld_tool %}
bld/gir
bin/vala
bld/glib
bld/wayland
bld/gdk/pixbuf
{% endblock %}

{% block bld_data %}
lib/glib/gir
lib/pango/gir
lib/harfbuzz/gir
lib/gdk/pixbuf/gir
lib/gi/repository/gir
lib/gtk/{{gtk_ver}}/gir
lib/gtk/layer/shell/{{gtk_ver}}/gir
{% endblock %}

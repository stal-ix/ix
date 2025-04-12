{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
terminal
{% endblock %}

{% block version %}
6.2.0
{% endblock %}

{% block fetch %}
https://github.com/elementary/terminal/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:cf268cb590c6355962feabf80a10e355cfc19b3d6db5c7e648cda82592707d74
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk
lib/vte
lib/gee
lib/handy
lib/granite
lib/gtk/deps
{% endblock %}

{% block bld_tool %}
bld/gir
bin/vala
bld/glib
bld/gettext
bld/fake(tool_name=xvfb-run)
{% endblock %}

{% block bld_data %}
lib/gee/gir
lib/handy/gir
lib/vte/{{gtk_ver}}/gir
lib/granite/{{gtk_ver}}/gir
{% endblock %}

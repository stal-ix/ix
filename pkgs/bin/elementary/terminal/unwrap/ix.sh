{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
terminal
{% endblock %}

{% block version %}
7.1.2
{% endblock %}

{% block fetch %}
https://github.com/elementary/terminal/archive/refs/tags/{{self.version().strip()}}.tar.gz
486d8e6c49e786aab61d9e6c70f5f06bfb7fa2ec6502aa540f94ee2998e13e8b
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

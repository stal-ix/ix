{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
terminal
{% endblock %}

{% block version %}
7.0.0
{% endblock %}

{% block fetch %}
https://github.com/elementary/terminal/archive/refs/tags/{{self.version().strip()}}.tar.gz
57f4c3670e74265cfcf6d6b03a29ea9677f1404d5fb62dd7fea1fcb45071d166
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

{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
terminal
{% endblock %}

{% block version %}
7.1.0
{% endblock %}

{% block fetch %}
https://github.com/elementary/terminal/archive/refs/tags/{{self.version().strip()}}.tar.gz
5a2552d8969383d473502b921210d55bc94a0de50aef2a3057205fc72a62e125
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

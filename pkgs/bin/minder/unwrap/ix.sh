{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/phase1geo/Minder/archive/refs/tags/1.16.4.tar.gz
sha:3a9c2831d36a7744f7df27412b2f75b2bec38f5974984a027d6fa7f634a37c7e
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk
lib/gee
lib/xml/2
lib/cairo
lib/handy
lib/granite
lib/archive
lib/discount
lib/json/glib
lib/gtk/source/view
{% endblock %}

{% block bld_tool %}
bld/gir
bld/glib
bin/vala
bld/gettext
{% endblock %}

{% block bld_data %}
lib/gee/gir
lib/gi/files
lib/handy/gir
lib/granite/{{gtk_ver}}/gir
lib/gtk/source/view/{{1 + gtk_ver | int}}/gir
{% endblock %}

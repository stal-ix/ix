{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
dino
{% endblock %}

{% block version %}
0.5.0
{% endblock %}

{% block fetch %}
https://github.com/dino/dino/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:4c57f20677f47f41b440b7d6eebb697ee89d5d8c38d334ad47c6b5de19894768
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk
lib/gee
lib/icu
lib/glib
lib/nice
lib/gpg/me
lib/gcrypt
lib/soup/3
lib/srtp/2
lib/adwaita
lib/sqlite/3
lib/qrencode
lib/gtk/deps
lib/gstreamer
lib/glib/networking
lib/signal/protocol/c
{% endblock %}

{% block bld_data %}
lib/gee/gir
lib/glib/gir
lib/adwaita/vapi
lib/gi/repository/gir
{% endblock %}

{% block bld_tool %}
bld/glib
bin/vala
bld/gettext
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

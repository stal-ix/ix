{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/dino/dino/archive/refs/tags/v0.4.4.tar.gz
sha:29f37dc3a54fb123f223964d01de76fcea038ca6d134aa35b75c62b07acb9d03
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
lib/adwaita/vapi
lib/glib/networking
lib/signal/protocol/c
{% endblock %}

{% block bld_data %}
lib/gee/gir
lib/gi/files
{% endblock %}

{% block bld_tool %}
bld/glib
bin/vala
bld/gettext
{% endblock %}

{% block cmake_flags %}
USE_SOUP3=ON
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

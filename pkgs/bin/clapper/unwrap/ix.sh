{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/Rafostar/clapper/archive/refs/tags/0.6.1.tar.gz
sha:d244ec6108ebff5ccc817a5888f3f73f52cac129fe480d480cb3f6b9db19cfbe
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk
lib/glib
lib/soup/3
lib/adwaita
lib/gtk/deps
lib/micro/dns
lib/gstreamer
lib/gstreamer/dl
{% endblock %}

{% block bld_tool %}
bld/wrapcc/link/new
bld/glib
bld/gnome
bld/gettext
bld/fake(tool_name=update-mime-database)
{% endblock %}

{% block meson_flags %}
clapper-app=enabled
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

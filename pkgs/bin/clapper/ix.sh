{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/Rafostar/clapper/archive/refs/tags/0.6.1.tar.gz
sha:d244ec6108ebff5ccc817a5888f3f73f52cac129fe480d480cb3f6b9db19cfbe
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/gtk/4
lib/soup/3
lib/adwaita
lib/micro/dns
lib/gstreamer
{% endblock %}

{% block bld_tool %}
bld/glib
bld/gnome
bld/gettext
bld/fake(tool_name=update-mime-database)
{% endblock %}

{% block meson_flags %}
clapper-app=enabled
{% endblock %}


{% extends '//die/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libadwaita/-/archive/1.1.3/libadwaita-1.1.3.tar.bz2
sha:9e80cb97354bd6aa0c854c2031cc5c9e7e0b455e23cf2295042ceedcc650435d
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/gtk/4
lib/fribidi
{% endblock %}

{% block bld_tool %}
bin/sassc
bld/glib/codegen
{% endblock %}

{% block meson_flags %}
vapi=false
introspection=disabled
{% endblock %}

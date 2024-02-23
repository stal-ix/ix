{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libsecret/-/archive/0.21.4/libsecret-0.21.4.tar.bz2
sha:1c4927c895043c5f10b912d616edfb55ca0224d1079c820fc4b49b1d493ddd2d
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/gcrypt
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}

{% block meson_flags %}
manpage=false
gtk_doc=false
debugging=false
introspection=false
{% endblock %}

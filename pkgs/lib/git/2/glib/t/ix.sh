{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libgit2-glib/-/archive/v1.2.0/libgit2-glib-v1.2.0.tar.bz2
sha:421ac5c99e02c5b6235842e60eb7f9fa8dc580d2500fb1eb521ced8a22de9f29
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/git/2/old
{% endblock %}

{% block meson_flags %}
ssh=false
python=false
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}

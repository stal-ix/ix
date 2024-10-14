{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/hughsie/libxmlb/archive/refs/tags/0.3.20.tar.gz
sha:1bbff8cda1653cf196ba436fb51950630322e2bc133cbc52e3cdcf395e0c8075
{% endblock %}

{% block lib_deps %}
lib/c
lib/xz
lib/zstd
lib/glib
lib/stemmer
{% endblock %}

{% block meson_flags %}
gtkdoc=false
introspection=false
tests=false
{% endblock %}

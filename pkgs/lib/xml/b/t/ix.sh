{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/hughsie/libxmlb/archive/refs/tags/0.3.14.tar.gz
sha:92bea792c6a33d243e7b6f210519bd6ba71b010463fbec1b5a71ddd35736ec20
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

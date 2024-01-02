{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/hughsie/libxmlb/archive/refs/tags/0.3.15.tar.gz
sha:68ee69002cc2b792fca250d7a7df2a8e3f8e43ccd6ab7b14c8481407b95e7087
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

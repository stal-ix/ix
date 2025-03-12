{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/hughsie/libxmlb/archive/refs/tags/0.3.22.tar.gz
sha:103684ed37a45d0aed8f95e97294ed26945b5aeebf44734f3994081eecebb11c
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

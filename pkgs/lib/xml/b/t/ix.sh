{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libxmlb
{% endblock %}

{% block version %}
0.3.22
{% endblock %}

{% block fetch %}
https://github.com/hughsie/libxmlb/archive/refs/tags/{{self.version().strip()}}.tar.gz
103684ed37a45d0aed8f95e97294ed26945b5aeebf44734f3994081eecebb11c
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

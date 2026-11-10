{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libxmlb
{% endblock %}

{% block version %}
0.3.30
{% endblock %}

{% block fetch %}
https://github.com/hughsie/libxmlb/archive/refs/tags/{{self.version().strip()}}.tar.gz
42bccefed2c210fd6161485bdc0c76574d1c8d24e397f21cf29ff25003e8026a
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

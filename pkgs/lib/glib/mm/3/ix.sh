{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/glibmm/2.82/glibmm-2.82.0.tar.xz
sha:38684cff317273615c67b8fa9806f16299d51e5506d9b909bae15b589fa99cb6
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/sigc++/3
{% endblock %}

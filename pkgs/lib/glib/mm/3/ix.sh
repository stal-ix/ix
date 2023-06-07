{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/glibmm/2.76/glibmm-2.76.0.tar.xz
sha:8637d80ceabd94fddd6e48970a082a264558d4ab82684e15ffc87e7ef3462ab2
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/sigc++/3
{% endblock %}

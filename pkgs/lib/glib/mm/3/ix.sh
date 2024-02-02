{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/glibmm/2.78/glibmm-2.78.1.tar.xz
sha:f473f2975d26c3409e112ed11ed36406fb3843fa975df575c22d4cb843085f61
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/sigc++/3
{% endblock %}

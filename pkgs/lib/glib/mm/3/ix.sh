{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/glibmm/2.84/glibmm-2.84.0.tar.xz
sha:56ee5f51c8acfc0afdf46959316e4c8554cb50ed2b6bc5ce389d979cbb642509
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/sigc++/3
{% endblock %}

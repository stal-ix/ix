{% extends '//die/c/meson.sh' %}

{% block version %}
0.4.7
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libspelling/-/archive/{{self.version().strip()}}/libspelling-{{self.version().strip()}}.tar.bz2
sha:96fc2b1ae447536e00a6231541bb177a08fda6f30fdfeae68a0622040d82d827
{% endblock %}

{% block lib_deps %}
lib/c
lib/icu
lib/glib
lib/gtk/4
lib/pango
lib/enchant
lib/gtk/source/view/5
{% endblock %}

{% block meson_flags %}
introspection=disabled
sysprof=false
vapi=false
docs=false
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

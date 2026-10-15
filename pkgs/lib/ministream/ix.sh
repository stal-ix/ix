{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
ministream
{% endblock %}

{% block version %}
0.99.1
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/ministream/-/archive/{{self.version().strip()}}/ministream-{{self.version().strip()}}.tar.bz2
6dc5867dfa272601600ec8830e0a20a328545720f0933d356b83d5686747779d
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
{% endblock %}

{% block meson_flags %}
introspection=disabled
as-compare=disabled
tests=false
{% endblock %}

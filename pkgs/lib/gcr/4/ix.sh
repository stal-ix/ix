{% extends '//lib/gcr/t/ix.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gcr/-/archive/4.4.0.1/gcr-4.4.0.1.tar.bz2
sha:886b7d1614b3fe109169d1ea20234fbc262eff2b36eb787fc0d2bf77cc368bc7
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/gtk/4
{% endblock %}

{% block meson_flags %}
vapi=false
{{super()}}
{% endblock %}

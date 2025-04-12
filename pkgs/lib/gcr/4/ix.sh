{% extends '//lib/gcr/t/ix.sh' %}

{% block version %}
4.4.0.1
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gcr/-/archive/{{self.version().strip()}}/gcr-{{self.version().strip()}}.tar.bz2
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

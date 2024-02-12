{% extends '//lib/gcr/t/ix.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gcr/-/archive/4.2.0/gcr-4.2.0.tar.bz2
sha:3596dfda370bac19ba722e4ee2abcc70408f4a0c2688747d95a244586e9a1805
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/gtk/4
{% endblock %}

{% block meson_flags %}
vapi=false
{{super()}}
{% endblock %}

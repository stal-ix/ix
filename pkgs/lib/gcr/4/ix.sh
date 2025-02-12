{% extends '//lib/gcr/t/ix.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gcr/-/archive/4.3.91/gcr-4.3.91.tar.bz2
sha:323a90547cf9c3a0f07b7af9ecd38a8c7cf912bd0190e87d19dfa89b2e854567
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/gtk/4
{% endblock %}

{% block meson_flags %}
vapi=false
{{super()}}
{% endblock %}

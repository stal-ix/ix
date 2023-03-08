{% extends '//lib/gcr/t/ix.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gcr/-/archive/4.1.0/gcr-4.1.0.tar.bz2
sha:3fa4bceaee1f1a9ee1f81157969f1262df19dae975c8a148d5f4c425f866573a
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/gtk/4
{% endblock %}

{% block meson_flags %}
vapi=false
{{super()}}
{% endblock %}

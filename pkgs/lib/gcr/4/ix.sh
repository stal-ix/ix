{% extends '//lib/gcr/t/ix.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gcr/-/archive/4.3.0/gcr-4.3.0.tar.bz2
sha:a674f189293e4068a8bd26981f5d31571e02af5b2c934623c67cf3d8cd7f57b8
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/gtk/4
{% endblock %}

{% block meson_flags %}
vapi=false
{{super()}}
{% endblock %}

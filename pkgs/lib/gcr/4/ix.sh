{% extends '//lib/gcr/t/ix.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gcr/-/archive/4.2.1/gcr-4.2.1.tar.bz2
sha:32dee38cf0c33608bede5dc24ea461760412a08969a4e2284b14ca19c4169498
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/gtk/4
{% endblock %}

{% block meson_flags %}
vapi=false
{{super()}}
{% endblock %}

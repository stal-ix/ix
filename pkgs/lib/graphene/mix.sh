{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://github.com/ebassi/graphene/archive/refs/tags/1.10.6.tar.gz
c7858bbcdcbf272b6845cd4b4a9c1ade
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
{% endblock %}

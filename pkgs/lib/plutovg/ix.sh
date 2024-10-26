{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/sammycage/plutovg/archive/refs/tags/v0.0.8.tar.gz
sha:090dd5d38e04e0900bf6843b2b38ce7108cab815c1b5496c934af65c51965618
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

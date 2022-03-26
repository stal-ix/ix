{% extends '//mix/meson.sh' %}

{% block fetch %}
https://github.com/fribidi/fribidi/archive/refs/tags/v1.0.11.tar.gz
2acb412d284f5918de3638c1052160dd
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block meson_flags %}
docs=false
tests=false
{% endblock %}

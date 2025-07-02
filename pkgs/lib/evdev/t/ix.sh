{% extends '//die/c/meson.sh' %}

{% include 'ver.sh' %}

{% block meson_flags %}
tests=disabled
documentation=disabled
{% endblock %}

{% block lib_deps %}
lib/c
lib/kernel
{% endblock %}

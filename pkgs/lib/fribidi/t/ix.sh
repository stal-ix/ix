{% extends '//die/c/meson_cross.sh' %}

{% block fetch %}
https://github.com/fribidi/fribidi/archive/refs/tags/v1.0.14.tar.gz
sha:7b1b3837f6583432068c71ca333a8988c803e9b94259edbd37c85367bbc51446
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block meson_flags %}
docs=false
tests=false
{% endblock %}

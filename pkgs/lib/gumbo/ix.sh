{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/google/gumbo-parser/archive/refs/tags/v0.11.0.tar.gz
sha:
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/commonmark/cmark/archive/refs/tags/0.30.3.tar.gz
sha:85e9fb515531cc2c9ae176d693f9871774830cf1f323a6758fb187a5148d7b16
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

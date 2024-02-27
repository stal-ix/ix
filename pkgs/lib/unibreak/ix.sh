{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/adah1972/libunibreak/archive/refs/tags/libunibreak_6_0.tar.gz
sha:09e9d2f41e1179f9cb9aec60abe768bec66290037a6d35450d2dc002d4d85dff
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/adah1972/libunibreak/archive/refs/tags/libunibreak_6_1.tar.gz
sha:890674996168ef5ba143d80d49ab8b61594a4eb70198dcac76caf6e1bd264a41
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

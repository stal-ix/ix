{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/openSUSE/xinetd/archive/refs/tags/2.3.15.4.tar.gz
sha:cbb6d078a8e4d0297cbfc146d5acd0b598de7d30dd0f76301a52ca923b42129a
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cpp_missing %}
stdlib.h
{% endblock %}

{% block cpp_defines %}
_GNU_SOURCE=1
{% endblock %}

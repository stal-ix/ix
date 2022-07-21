{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/tenacityteam/libmad/archive/refs/tags/0.16.2.tar.gz
sha:6c14c2f4dcf7fd32e447eef99d6c53faded52e22f95e223e6f58844030851b99
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

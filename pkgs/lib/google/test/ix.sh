{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
googletest
{% endblock %}

{% block version %}
1.18.0
{% endblock %}

{% block fetch %}
https://github.com/google/googletest/archive/refs/tags/v{{self.version().strip()}}.tar.gz
6e3191c1455468b3fc35a417fb565c1c5071aee1b7e7f85e30cf48a98d37d8b5
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

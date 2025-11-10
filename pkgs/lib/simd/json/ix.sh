{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
simdjson
{% endblock %}

{% block version %}
4.2.1
{% endblock %}

{% block fetch %}
https://github.com/simdjson/simdjson/archive/refs/tags/v{{self.version().strip()}}.tar.gz
72c60a0fa6871073a4a458e80947dd75894fa1ff69550c7c77f9f4e695dff7f1
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

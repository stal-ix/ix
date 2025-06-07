{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
simdjson
{% endblock %}

{% block version %}
3.13.0
{% endblock %}

{% block fetch %}
https://github.com/simdjson/simdjson/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:07a1bb3587aac18fd6a10a83fe4ab09f1100ab39f0cb73baea1317826b9f9e0d
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

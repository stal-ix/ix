{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/simdjson/simdjson/archive/refs/tags/v3.11.4.tar.gz
sha:1029aff6bcca7811fb7b6d5421c5c9024b8e74e84cd268680265723f42e23cf2
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% extends '//die/c/cmake.sh' %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
JSON_BuildTests=OFF
{% endblock %}

{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/nlohmann/json/archive/refs/tags/v3.10.5.tar.gz
sha:5daca6ca216495edf89d167f808d1d03c4a4d929cef7da5e10f135ae1540c7e4
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
JSON_BuildTests=OFF
{% endblock %}

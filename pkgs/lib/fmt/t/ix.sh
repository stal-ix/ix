{% extends '//die/c/cmake.sh' %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
FMT_DOC=OFF
FMT_TEST=OFF
FMT_FUZZ=OFF
{% endblock %}

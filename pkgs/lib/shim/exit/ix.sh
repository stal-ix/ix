{% extends '//die/inline/library.sh' %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block sources %}
stdlib.h
stdlib.cpp
{% endblock %}

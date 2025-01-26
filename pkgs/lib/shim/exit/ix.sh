{% extends '//die/inline/library.sh' %}

{% block lib_deps %}
lib/c
lib/c++
lib/build/w/include/next
{% endblock %}

{% block sources %}
stdlib.h
stdlib.cpp
{% endblock %}

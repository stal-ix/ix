{% extends '//die/inline/library.sh' %}

{% block lib_deps %}
lib/c
lib/build/w/include/next
{% endblock %}

{% block sources %}
malloc.h
malloc.cpp
{% endblock %}

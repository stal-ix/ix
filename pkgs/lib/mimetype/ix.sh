{% extends '//die/inline/library.sh' %}

{% block lib_deps %}
lib/c
lib/c++
lib/magic
{% endblock %}

{% block sources %}
mt.cpp
{% endblock %}

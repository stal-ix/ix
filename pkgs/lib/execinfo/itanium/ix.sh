{% extends '//die/inline/library.sh' %}

{% block lib_deps %}
lib/c
lib/c++
lib/execinfo/format
{% endblock %}

{% block sources %}
backtrace.cpp
{% endblock %}

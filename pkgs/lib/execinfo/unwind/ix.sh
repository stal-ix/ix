{% extends '//die/inline/library.sh' %}

{% block lib_deps %}
lib/c
lib/unwind
lib/execinfo/format
{% endblock %}

{% block sources %}
backtrace.c
{% endblock %}

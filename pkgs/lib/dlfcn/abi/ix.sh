{% extends '//die/inline/library.sh' %}

{% block lib_deps %}
lib/dlfcn/dispatch
{% endblock %}

{% block sources %}
fakes.c
{% endblock %}

{% extends '//die/inline/library.sh' %}

{% block lib_deps %}
lib/dlfcn
{% endblock %}

{% block sources %}
fakes.c
{% endblock %}

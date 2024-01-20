{% extends '//die/inline/library.sh' %}

{% block lib_deps %}
lib/dlfcn/unwrap
{% endblock %}

{% block sources %}
fakes.c
{% endblock %}

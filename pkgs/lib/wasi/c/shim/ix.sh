{% extends '//die/inline/library.sh' %}

{% block lib_deps %}
lib/wasi/c/unwrap
{% endblock %}

{% block sources %}
unistd.h
unistd.c
signal.h
signal.c
{% endblock %}

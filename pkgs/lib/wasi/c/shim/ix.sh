{% extends '//die/inline/library.sh' %}

{% block lib_deps %}
lib/wasi/c/unwrap
lib/build/w/include/next
{% endblock %}

{% block sources %}
unistd.h
unistd.c
signal.h
signal.c
{% endblock %}

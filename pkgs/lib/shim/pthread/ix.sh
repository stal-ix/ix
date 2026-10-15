{% extends '//die/inline/library.sh' %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block sources %}
pthread.c
pthread.h
{% endblock %}

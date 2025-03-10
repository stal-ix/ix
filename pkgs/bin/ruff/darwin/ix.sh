{% extends '//die/inline/library.sh' %}

{% block lib_deps %}
lib/c
lib/jemalloc/init
{% endblock %}

{% block sources %}
fakes.c
{% endblock %}

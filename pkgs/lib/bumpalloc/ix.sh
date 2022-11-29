{% extends '//die/inline/library.sh' %}

{% block setup %}
export CFLAGS="-fno-builtin ${CFLAGS}"
{% endblock %}

{% block sources %}
alloc.c
{% endblock %}

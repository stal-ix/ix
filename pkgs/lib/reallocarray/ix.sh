{% extends '//die/inline/library.sh' %}

{% block lib_deps %}
lib/c/naked
{% endblock %}

{% block setup %}
export CFLAGS="-fno-builtin ${CFLAGS}"
{% endblock %}

{% block sources %}
reallocarray.cpp
{% endblock %}

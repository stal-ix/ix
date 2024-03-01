{% extends '//die/inline/library.sh' %}

{% block lib_deps %}
lib/shim/gnu/basename
{% endblock %}

{% block sources %}
string.c
string.h
{% endblock %}

{% block env %}
export CPPFLAGS="-D_GNU_SOURCE \${CPPFLAGS}"
{% endblock %}

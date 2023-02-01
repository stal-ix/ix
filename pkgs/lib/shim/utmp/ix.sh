{% extends '//die/inline/library.sh' %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block sources %}
login.c
{% endblock %}

{% block env %}
export CFLAGS="-Wno-implicit-function-declaration \${CFLAGS}"
{% endblock %}

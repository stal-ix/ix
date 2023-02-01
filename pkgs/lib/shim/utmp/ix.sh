{% extends '//die/inline/library.sh' %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block sources %}
login.c
{% endblock %}

{#
logsys.c:177:9: error: call to undeclared function 'login';
ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration
login(&ut);
#}

{% block env %}
export CFLAGS="-Wno-implicit-function-declaration \${CFLAGS}"
{% endblock %}

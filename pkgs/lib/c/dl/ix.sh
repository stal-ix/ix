{% extends '//die/dl/fix.sh' %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block export_symbols %}
{% include 'libc' %}
{% endblock %}

{% block export_lib %}
c
{% endblock %}

{% block setup %}
export CFLAGS="-fno-builtin ${CFLAGS}"
{% endblock %}

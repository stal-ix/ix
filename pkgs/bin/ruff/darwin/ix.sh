{% extends '//die/inline/library.sh' %}

{% block setup_target_flags %}
export CFLAGS="-fno-builtin ${CFLAGS}"
{% endblock %}

{% block sources %}
fakes.c
{% endblock %}

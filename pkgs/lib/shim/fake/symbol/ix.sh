{% extends '//die/inline/library.sh' %}

{% block cpp_defines %}
IX_FAKE_SYMBOL={{symbol_name}}
{% endblock %}

{% block setup_target_flags %}
{{super()}}
export CFLAGS="-fno-builtin ${CFLAGS}"
{% endblock %}

{% block sources %}
symbol.c
{% endblock %}

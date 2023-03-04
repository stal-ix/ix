{% extends '//die/inline/library.sh' %}

{% block cpp_defines %}
IX_BUMPALLOC_BUF={{bumpalloc_buf}}
{% endblock %}

{% block setup %}
export CFLAGS="-fno-builtin ${CFLAGS}"
{% endblock %}

{% block sources %}
alloc.c
{% endblock %}

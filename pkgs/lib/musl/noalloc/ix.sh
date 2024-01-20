{% extends '//lib/musl/t/ix.sh' %}

{% block cpp_defines %}
__libc_realloc=realloc
__libc_free=free
__libc_malloc=malloc
__libc_calloc=calloc
{% endblock %}

{% block patch %}
{{super()}}
>src/legacy/valloc.c
find src/malloc -type f -name '*.c' | while read l; do
    echo > ${l}
done
{% endblock %}

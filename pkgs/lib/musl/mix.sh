{% extends '//lib/musl/t/mix.sh' %}

{% block std_box %}
bld/bootbox
{% endblock %}

{% block cpp_defines %}
__libc_realloc=realloc
__libc_free=free
__libc_malloc=malloc
__libc_calloc=calloc
{% endblock %}

{% block patch %}
{{super()}}
>src/legacy/valloc.c
>src/malloc/lite_malloc.c
{% endblock %}

{% block install %}
{{super()}}
rm -rf ${out}/lib/libc.a obj/src/malloc
ar q ${out}/lib/libc.a $(find obj -type f | sort)
ranlib ${out}/lib/libc.a
{% endblock %}

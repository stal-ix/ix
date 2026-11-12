{% extends '//lib/musl/noalloc/ix.sh' %}

{% block patch %}
{{super()}}
find src/ldso -type f | grep -v dl_iterate_phdr | while read l; do
    rm ${l}
done
{% if x86_64 %}
{# lib/str (lib/musl/naked) defines these, all in one object: a copy of any of them here could be linked beside it #}
for f in memcpy memmove memset memcmp memchr strlen strnlen strcpy strcat strcmp strspn strcspn \
         bcmp bcopy bzero explicit_bzero mempcpy strncat strlcpy strlcat strpbrk strsep strtok strtok_r \
         strdup strndup memmem strstr
do
    >src/string/${f}.c
done
>src/string/x86_64/memcpy.s
>src/string/x86_64/memmove.s
>src/string/x86_64/memset.s
{% endif %}
{% endblock %}

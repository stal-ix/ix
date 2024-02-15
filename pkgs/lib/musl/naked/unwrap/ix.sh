{% extends '//lib/musl/noalloc/ix.sh' %}

{% block patch %}
{{super()}}
find src/ldso -type f | grep -v dl_iterate_phdr | while read l; do
    rm ${l}
done
{% endblock %}

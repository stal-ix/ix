{% extends '//lib/gi/files/full/ix.sh' %}

{% block postinstall %}
{{super()}}
find ${out} -type f -name '*.gir' | grep -v GdkPixbuf | while read l; do
    rm ${l}
done
{% endblock %}

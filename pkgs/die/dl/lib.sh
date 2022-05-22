{% extends 'fix.sh' %}

{% block std_box %}
bld/scripts/librarian
{{super()}}
{% endblock %}

{% block export_map %}
{% for x in ix.parse_list(self.export_libs()) %}
listsym $(findlib {{x}}) | while read l; do
    echo "{{self.export_lib().strip()}} ${l} ${l}"
done
{% endfor %}
{% endblock %}

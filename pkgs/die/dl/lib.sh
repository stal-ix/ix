{% extends 'fix.sh' %}

{% block std_box %}
bld/librarian
{{super()}}
{% endblock %}

{% block export_map %}
{{super()}}
{% for x in ix.parse_list(self.export_libs()) %}
findlib {{x}}
listsym $(findlib {{x}}) | while read l; do
    echo "{{self.export_lib().strip()}} ${l} ${l}"
done
{% endfor %}
{% endblock %}

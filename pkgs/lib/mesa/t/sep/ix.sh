{% extends '//lib/mesa/t/nodrv/ix.sh' %}

{% block c_rename_symbol %}
{{super()}}
handle_table_remove
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/librarian
{% endblock %}

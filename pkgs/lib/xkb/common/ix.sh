{% extends 't/ix.sh' %}

{% block meson_flags %}
{{super()}}
enable-tools=false
{% endblock %}

{% block c_rename_symbol %}
{{super()}}
list_init
list_insert
list_append
list_remove
list_empty
{% endblock %}

{% extends 't/ix.sh' %}

{% block use_data %}
lib/gtk/source/view/5/data
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/reloc
{% endblock %}

{% block configure %}
{{super()}}
relocate "${SOURCE_VIEW_DATA}"
{% endblock %}

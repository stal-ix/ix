{% extends '//lib/wacom/t/ix.sh' %}

{% block use_data %}
lib/wacom/data
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/scripts/reloc
{% endblock %}

{% block configure %}
{{super()}}
relocate "${WACOM_DATA}"
{% endblock %}
